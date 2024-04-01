//
//  AppDependencyConfigure.swift
//  ModularisationStarter
//
//  Created by Akadet.m on 1/4/2567 BE.
//

import AnalyticInterface
import Analytics
import DependencyContainer
import Foundation

enum AppDependencyConfigure {
    static func configure() {
        let analyticTracker = AnalyticsEventTracker()
        DC.shared.register(type: .singleInstance(analyticTracker), for: AnalyticsEventTracking.self)
    }
}
