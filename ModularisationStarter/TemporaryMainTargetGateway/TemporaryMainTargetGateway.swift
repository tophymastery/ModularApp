//
//  TemporaryMainTargetGateway.swift
//  ModularisationStarter
//
//  Created by Akadet.m on 2/4/2567 BE.
//

import TemporaryMainPackageInterface
import CommonModels
import UIKit
import SongDetailsInterface
import DependencyContainer

struct TemporaryMainTargetGateway: TemporaryMainPackageInterface {
    func makeSongDetailModule(
        navigationController: UINavigationController?,
        song: Song
    ) -> UIViewController {
        let gateway = DC.shared.resolve(type: .closureBased, for: SongDetailsInterface.self)
        return gateway.makeSongDetailsModule(navigation: navigationController, song: song)
    }
}
