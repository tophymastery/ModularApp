//
//  File.swift
//  
//
//  Created by Akadet.m on 1/4/2567 BE.
//

import Foundation

protocol ClosureBasedProtocol {
    func sampleMethod()
}

struct ClosureBasedImpl: ClosureBasedProtocol {
    func sampleMethod() {

    }
}

protocol AnotherDependencyProtocol {
    func anotherSampleMethod()
}

struct AnotherDependencyImpl: AnotherDependencyProtocol {
    private let service: ClosureBasedProtocol

    init(service: ClosureBasedProtocol) {
        self.service = service
    }

    func anotherSampleMethod() {

    }
}
