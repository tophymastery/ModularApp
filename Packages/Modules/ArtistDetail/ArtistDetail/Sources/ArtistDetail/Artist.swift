//
//  Artist.swift
//
//
//  Created by Akadet.m on 1/4/2567 BE.
//

import Foundation
import CommonModels

public struct Artist: Codable {
    public let name: String
    public let birthDate: Date
    public let songs: [Song]

    public init(name: String, birthDate: Date, songs: [Song]) {
        self.name = name
        self.birthDate = birthDate
        self.songs = songs
    }
}
