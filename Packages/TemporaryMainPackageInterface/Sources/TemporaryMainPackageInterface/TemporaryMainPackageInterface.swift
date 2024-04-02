// The Swift Programming Language
// https://docs.swift.org/swift-book

import CommonModels
import UIKit

public protocol TemporaryMainPackageInterface {
    func makeSongDetailModule(
        navigationController: UINavigationController?,
        song: Song
    ) -> UIViewController
}
