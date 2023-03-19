//
//  Filter.swift
//  ProtoDM
//
//  Created by Alex Po on 19.03.2023.
//

import Foundation

struct Filter: Identifiable, Hashable {
    var id: UUID
    var name: String
    var icon: String
    var minModificationDate = Date.distantPast //so, by default we can see all issues from the distant past
    var tag: Tag?

    // all issues
    static var all = Filter(id: UUID(), name: "All Issues", icon: "tray")

    // recent issues
    static var recent = Filter(
        id: UUID(), name: "Recent Issues", icon: "clock",
        minModificationDate: .now.addingTimeInterval(86400 * -7)
    )

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Filter, rhs: Filter) -> Bool {
        lhs.id == rhs.id
    }
}
