//
//  File.swift
//  
//
//  Created by Akadet.m on 2/4/2567 BE.
//

import CommonModels
import SongDetailsInterface
import Foundation
import UIKit

public struct SongDetailsGateway: SongDetailsInterface {
    public init() {}

    public func makeSongDetailsModule(
        navigation: UINavigationController?,
        song: Song
    ) -> UIViewController {
        let coordinator = SongDetailsCoordinator(navigationController: navigation)
        return coordinator.makeViewController(with: song)
    }
}
