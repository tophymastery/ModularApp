// The Swift Programming Language
// https://docs.swift.org/swift-book

import CommonModels
import UIKit

public protocol SongDetailsInterface {
    func makeSongDetailsModule(
        navigation: UINavigationController?,
        song: Song
    ) -> UIViewController
}
