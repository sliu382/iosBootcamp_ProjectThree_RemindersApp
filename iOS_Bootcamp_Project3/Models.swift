//
//  Models.swift
//  iOS_Bootcamp_Project3
//
//  Created by Siyu Liu on 2/25/26.
//

import Foundation
import SwiftUI

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct RemindersPage: Identifiable {
    var id: UUID = UUID()
    var title: String
    var items: [Reminder]
    var color: Color
}
