//
//  UserFilterRow.swift
//  ProtoDM
//
//  Created by Alex Po on 20.08.2023.
//

import SwiftUI

struct UserFilterRow: View {
    var filter: Filter
    var delete: (Filter) -> Void
    var rename: (Filter) -> Void

    var body: some View {
        NavigationLink(value: filter) {
            Label(filter.name, systemImage: filter.icon)
                .badge(filter.tag?.tagActiveIssues.count ?? 0)
                .contextMenu {
                    Button {
                        rename(filter)
                    } label: {
                        Label("Rename", systemImage: "pencil")
                    }
                    Button(role: .destructive) {
                        delete(filter)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
        }
    }
}

//struct UserFilterRow_Previews: PreviewProvider {
//    static var previews: some View {
//        UserFilterRow()
//    }
//}
