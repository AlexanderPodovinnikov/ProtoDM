//
//  SideBarToolbarView.swift
//  ProtoDM
//
//  Created by Alex Po on 19.08.2023.
//

import SwiftUI

struct SideBarToolbarView: View {
    @EnvironmentObject var dataController: DataController
    @Binding var showingAwards: Bool

    var body: some View {
        //            Button {
        //                dataController.deleteAll()
        //                dataController.createSampleData()
        //            } label: {
        //                Label("ADD SAMPLE DATA", systemImage: "flame")
        //            }
                    Button {
                        dataController.newTag()
                    } label: {
                        Label("Add tag", systemImage: "plus")
                    }
                    Button {
                        showingAwards.toggle()
                    } label: {
                        Label("Show awards", systemImage: "rosette")
                    }
    }
}

struct SideBarToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarToolbarView(showingAwards: .constant(true))
    }
}
