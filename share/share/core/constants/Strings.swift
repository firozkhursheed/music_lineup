//
//  Strings.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

struct Strings {
    // General
    static let loading = "Loading..."
    static let errorPrefix = "Error: "

    // Specific to features or views
    struct FestivalLineup {
        static let title = "LINE UP"
        static let datePrefix = "Date: "
        static let locationPrefix = "Location: "
        // Add more strings specific to the Festival Lineup feature
    }

    // Assets
    struct Assets {
        static let music = "music"
        
        struct SFImage {
            static let calendar = "calendar"
            static let clock = "clock"
            static let figureWalk = "figure.walk"
            static let heart = "heart"
            static let ticket = "ticket"
            static let dollarsign = "dollarsign"
            static let star = "star"
            static let share = "square.and.arrow.up"
            static let musicNote = "music.note.list"
        }
    }
}
