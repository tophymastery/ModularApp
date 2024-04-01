//
//  AnalyticsEventTracker.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 14.02.24.
//

import Foundation
import AnalyticInterface

final class AnalyticsEventTracker: AnalyticsEventTracking {

    init() {}
    
    func trackEvent(_ event: AnalyticsEvent) {
        // Call analytics 3rd party framework or your own implementation to track an event
    }
}
