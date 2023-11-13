//
//  AppDateFormatter.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation

/// A utility class for managing date formats and conversions.
class DateFormatManager {
    static let shared = DateFormatManager()

    private init() {} // Private initializer for singleton

    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        return formatter
    }()

    lazy var dayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy" // Format: Mon, 3 Sept 2023
        return formatter
    }()
    
    lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a" // Format: 2:30 PM
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        return formatter
    }()

    func dateString(from date: Date) -> String {
        return dayDateFormatter.string(from: date)
    }

    func timeString(from date: Date) -> String {
        return timeFormatter.string(from: date).lowercased() // Lowercased for "am/pm"
    }

    func date(from string: String, format: String = "yyyy-MM-dd'T'HH:mm") -> Date? {
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
}
