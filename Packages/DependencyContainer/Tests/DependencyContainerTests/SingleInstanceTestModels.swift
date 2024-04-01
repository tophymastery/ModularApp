//
//  File.swift
//  
//
//  Created by Akadet.m on 1/4/2567 BE.
//

import Foundation

protocol SingleInstanceProtocol: AnyObject {
    func sampleMethod()
}

final class SingleInstanceImpl: SingleInstanceProtocol {
    func sampleMethod() {

    }
}
