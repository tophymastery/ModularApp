// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public protocol ArtistDetailInterface {
    func makeArtistDetailModule(
        navigationController: UINavigationController?,
        artistIdentifier: String
    ) -> UIViewController
}
