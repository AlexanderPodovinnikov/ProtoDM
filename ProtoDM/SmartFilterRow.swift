//
//  SmartFilterRow.swift
//  ProtoDM
//
//  Created by Alex Po on 20.08.2023.
//

import SwiftUI

struct SmartFilterRow: View {
    var filter: Filter
    var body: some View {
        NavigationLink(value: filter) {
            Label(filter.name, systemImage: filter.icon)
        }
    }
}

//struct SmartFilterRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SmartFilterRow()
//    }
//}
