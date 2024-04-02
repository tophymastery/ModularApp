//
//  TemporaryMainTargetGateway.swift
//  ModularisationStarter
//
//  Created by Akadet.m on 2/4/2567 BE.
//

import Foundation
import TemporaryMainPackageInterface
import CommonModels
import UIKit

struct TemporaryMainTargetGateway: TemporaryMainPackageInterface {
    func makeSongDetailModule(
        navigationController: UINavigationController?,
        song: Song
    ) -> UIViewController {
        let coordinator = SongDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(with: song)
    }
}
