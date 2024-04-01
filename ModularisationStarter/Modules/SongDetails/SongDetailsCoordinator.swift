//
//  SongDetailsCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import ArtistDetailInterface
import SwiftUI
import AnalyticInterface
import DependencyContainer
import CommonModels

final class SongDetailsCoordinator {

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func makeViewController(with song: Song) -> UIViewController {
        let analyticTracker = DC.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let view = SongDetailsView(
            viewModel: .init(
                song: song,
                analyticsTracker: analyticTracker,
                onGoToArtistTapped: pushArtistDetail(withIdentifier:)
            )
        )
        let hostingVC = UIHostingController(rootView: view)
        hostingVC.title = song.name
        return hostingVC
    }

    private func pushArtistDetail(withIdentifier id: String) {
        let gateway = DC.shared.resolve(type: .closureBased, for: ArtistDetailInterface.self)
        let view = gateway.makeArtistDetailModule(
            navigationController: navigationController,
            artistIdentifier: id
        )
        navigationController?.pushViewController(view, animated: true)
    }
}
