//
//  DependencyContainerRegistrationType.swift
//  
//
//  Created by Akadet.m on 31/3/2567 BE.
//

public enum DependencyContainerRegistrationType {
    case singleInstance(AnyObject?)
    case closureBased(Closure?)
}
