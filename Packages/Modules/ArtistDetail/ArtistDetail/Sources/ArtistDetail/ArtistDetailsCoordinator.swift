//
//  ArtistDetailsCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import SwiftUI
import AnalyticInterface
import DependencyContainer
import CommonModels
import SongDetailsInterface

final class ArtistDetailsCoordinator {

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func makeViewController(artistIdentifier: String) -> UIViewController {
        let analyticTracker = DC.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)

        let view = ArtistDetailsView(
            viewModel: .init(
                artistService: ArtistService(),
                analyticsTracker: analyticTracker,
                artistIdentifier: artistIdentifier,
                onSongSelected: pushSongDetail(_:)
            )
        )
        let hostingVC = UIHostingController(rootView: view)
        return hostingVC
    }

    func pushSongDetail(_ song: Song) {
        let gateway = DC.shared.resolve(type: .closureBased, for: SongDetailsInterface.self)
        let songDetailView = gateway.makeSongDetailsModule(navigation: navigationController, song: song)
        navigationController?.pushViewController(songDetailView, animated: true)
    }
}
