// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public typealias Closure = () -> Void
public typealias DC = DependencyContainer

public final class DependencyContainer {
    public let shared = DependencyContainer()

    private var singleInstanceDependencies: [ObjectIdentifier: AnyObject] = [:]
    private var closureBasesDependencies: [ObjectIdentifier: () -> Any] = [:]

    private let dependencyAccessQueue = DispatchQueue(
        label: Config.packageIdentifier + ".access.queue",
        attributes: .concurrent
    )

    private init() {

    }

    public func register(
        type: DependencyContainerRegistrationType,
        for interface: Any.Type
    ) {
        dependencyAccessQueue.sync(flags: .barrier) {
            let objectIdentifier = ObjectIdentifier(interface)

            switch type {
            case let .singleInstance(instance):
                singleInstanceDependencies[objectIdentifier] = instance

            case let .closureBased(closure):
                closureBasesDependencies[objectIdentifier] = closure
            }
        }
    }

    public func resolve<Value>(
        type: DependencyContainerResolvingType,
        for interface: Value.Type
    ) -> Value {
        var value: Value!

        dependencyAccessQueue.sync {
            let objectIdentifier = ObjectIdentifier(interface)

            switch type {
            case .singleInstance:
                guard
                    let singleInstanceDependency = singleInstanceDependencies[objectIdentifier] as? Value else {
                    fatalError("Could not retrieve a dependency for type: \(interface)")
                }

                value = singleInstanceDependency

            case .closureBased:
                guard
                    let closure = closureBasesDependencies[objectIdentifier],
                    let closureBasesDependencies = closure as? Value else {
                    fatalError("Could not retrieve closure based dependency for type: \(interface)")
                }

                value = closureBasesDependencies
            }
        }

        return value
    }
}
