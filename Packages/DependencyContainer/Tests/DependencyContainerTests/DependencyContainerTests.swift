import XCTest
@testable import DependencyContainer

final class DependencyContainerTests: XCTestCase {
    func test_single_instance_registration_and_resolving() {
        let instance = SingleInstanceImpl()
        DC.shared.register(type: .singleInstance(instance), for: SingleInstanceProtocol.self)

        let resolved = DC.shared.resolve(type: .singleInstance, for: SingleInstanceProtocol.self)
        XCTAssert(instance === resolved)
    }

    func test_closure_based_registration_and_resolve() {
        let closure: () -> ClosureBasedProtocol = {
            ClosureBasedImpl()
        }

        DC.shared.register(type: .closureBased(closure), for: ClosureBasedProtocol.self)

        let resolved = DC.shared.resolve(type: .closureBased, for: ClosureBasedProtocol.self)

        XCTAssert(resolved is ClosureBasedImpl)
    }

    func test_closure_based_dependency_that_depend_on_another() {
        let closure: () -> ClosureBasedProtocol = {
            ClosureBasedImpl()
        }

        DC.shared.register(type: .closureBased(closure), for: ClosureBasedProtocol.self)

        let anotherDependencyClosure: () -> AnotherDependencyProtocol = {
            let service = DC.shared.resolve(type: .closureBased, for: ClosureBasedProtocol.self)
            let anotherDependency = AnotherDependencyImpl(service: service)

            return anotherDependency
        }

        DC.shared.register(type: .closureBased(anotherDependencyClosure), for: AnotherDependencyProtocol.self)

        let resolvedAnotherDependency = DC.shared.resolve(type: .closureBased, for: AnotherDependencyProtocol.self)

        XCTAssert(resolvedAnotherDependency is AnotherDependencyImpl)
    }
}
