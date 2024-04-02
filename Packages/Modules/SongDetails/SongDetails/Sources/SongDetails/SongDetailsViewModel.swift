//
//  SongDetailsViewModel.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import Foundation
import AnalyticInterface
import CommonModels

final class SongDetailsViewModel {

    private let song: Song
    private let analyticsTracker: AnalyticsEventTracking
    private let onGoToArtistTapped: (String) -> Void

    init(song: Song, analyticsTracker: AnalyticsEventTracking, onGoToArtistTapped: @escaping (String) -> Void) {
        self.song = song
        self.analyticsTracker = analyticsTracker
        self.onGoToArtistTapped = onGoToArtistTapped
    }

    func name() -> String {
        song.name
    }

    func artistName() -> String {
        song.artistName
    }

    func lyrics() -> String {
        song.lyrics
    }

    // MARK: - Actions

    func didTapGoToArtist() {
        analyticsTracker.trackEvent(.init(name: SongDetailsEventName.artistTappedFromSongDetail))
        onGoToArtistTapped(song.artistIdentifier)
    }
}
