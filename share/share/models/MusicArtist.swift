//
//  Artist.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

// Properties for the Music line up element for Artist object. These will be used to store relevant information about each such item.
// It can be split into two models in real world
struct MusicArtist: Identifiable, Codable, Equatable {
    var artistName: String
    var id: Int
    var summary: String
    var location: String
    var date: String // Original date string
    var end: String
    var tags: [String]
    var artist_ids: [Int]
    var artist_info: String

    // Computed property to generate a unique identifier by combining the `id` and `name`.
    var uniqueIdentifier: String {
        "\(id)-\(artistName)"
    }

    // Computed property to format the `date` string into a human-readable format.
    var formattedDate: String {
        DateFormatManager.shared.date(from: date).map { DateFormatManager.shared.dateString(from: $0) } ?? ""
    }

    // Computed property to format the time into a human-readable time format.
    var formattedTime: String {
        DateFormatManager.shared.date(from: date).map { DateFormatManager.shared.timeString(from: $0) } ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case artistName = "name" // Maps the JSON key 'name' to 'artistName'
        case id, summary, location, date, end, tags, artist_ids, artist_info
    }
}
