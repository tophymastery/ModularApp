//
//  HomeCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import SwiftUI
import AnalyticInterface
import DependencyContainer

final class HomeCoordinator {

    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()

    func makeViewController() -> UIViewController {
        let analyticTracker = DC.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        
        let viewModel = HomeViewModel(
            homeService: HomeService(),
            analyticsTracker: analyticTracker,
            onSongSelected: pushSongDetail
        )

        let homeView = HomeView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: homeView)
        navigationController.setViewControllers([hostingVC], animated: false)

        return navigationController
    }

    func pushSongDetail(_ song: Song) {
        let coordinator = SongDetailsCoordinator(navigationController: navigationController)
        let songDetailView = coordinator.makeViewController(with: song)
        navigationController.pushViewController(songDetailView, animated: true)
    }
}
