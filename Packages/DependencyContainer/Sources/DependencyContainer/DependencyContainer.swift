// The Swift Programming Language
// https://docs.swift.org/swift-book

public typealias Closure = () -> Void

public enum DependencyContainerRegistrationType {
    case singleInstance(AnyObject?)
    case closureBased(Closure?)
}

public enum DependencyContainerResolvingType {
    case singleInstance
    case closureBased
}

public final class DependencyContainer {
    public let shared = DependencyContainer()

    private var singleInstanceDependencies: [ObjectIdentifier: AnyObject] = [:]
    private var closureBasesDependencies: [ObjectIdentifier: () -> Any] = [:]

    private init() {

    }

    public func register(
        type: DependencyContainerRegistrationType,
        for interface: Any.Type
    ) {
        let objectIdentifier = ObjectIdentifier(interface)

        switch type {
        case let .singleInstance(instance):
            singleInstanceDependencies[objectIdentifier] = instance

        case let .closureBased(closure):
            closureBasesDependencies[objectIdentifier] = closure
        }
    }

    public func resolve<Value>(
        type: DependencyContainerResolvingType,
        for interface: Value.Type
    ) -> Value {
        let objectIdentifier = ObjectIdentifier(interface)

        switch type {
        case .singleInstance:
            guard 
                let singleInstanceDependency = singleInstanceDependencies[objectIdentifier] as? Value else {
                fatalError("Could not retrieve a dependency for type: \(interface)")
            }

            return singleInstanceDependency

        case .closureBased:
            guard
                let closure = closureBasesDependencies[objectIdentifier],
                let closureBasesDependencies = closure as? Value else {
                fatalError("Could not retrieve closure based dependency for type: \(interface)")
            }

            return closureBasesDependencies
        }
    }
}
