//
//  ArtistDetailGateway.swift
//
//
//  Created by Akadet.m on 1/4/2567 BE.
//

import ArtistDetailInterface
import UIKit

public struct ArtistDetailGateway: ArtistDetailInterface {
    public init() {}

    public func makeArtistDetailModule(
        navigationController: UINavigationController?,
        artistIdentifier: String
    ) -> UIViewController {
        let coordinator = ArtistDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(artistIdentifier: artistIdentifier)
    }
}
