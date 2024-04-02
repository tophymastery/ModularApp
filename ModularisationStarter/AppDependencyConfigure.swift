//
//  AppDependencyConfigure.swift
//  ModularisationStarter
//
//  Created by Akadet.m on 1/4/2567 BE.
//

import ArtistDetail
import ArtistDetailInterface
import AnalyticInterface
import Analytics
import DependencyContainer
import Foundation
import TemporaryMainPackageInterface

enum AppDependencyConfigure {
    static func configure() {
        let analyticTracker = AnalyticsEventTracker()
        DC.shared.register(type: .singleInstance(analyticTracker), for: AnalyticsEventTracking.self)

        let artistDetailClosure: () -> ArtistDetailInterface = {
            ArtistDetailGateway()
        }
        DC.shared.register(type: .closureBased(artistDetailClosure), for: ArtistDetailInterface.self)

        let temporaryGateway: () -> TemporaryMainPackageInterface = {
            TemporaryMainTargetGateway()
        }
        DC.shared.register(type: .closureBased(temporaryGateway), for: TemporaryMainPackageInterface.self)
    }
}
