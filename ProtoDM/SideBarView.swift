//
//  SideBarView.swift
//  ProtoDM
//
//  Created by Alex Po on 19.03.2023.
//

import SwiftUI

struct SideBarView: View {
    @EnvironmentObject var dataController: DataController
    let smartFilters: [Filter] = [.all, .recent]
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>
    @State private var tagToRename: Tag?
    @State private var renamingTag = false
    @State private var tagName = ""

    @State private var showingAwards = false

    var tagFilters: [Filter] { //didChange ?
        tags.map {tag in
            Filter(id: tag.tagID, name: tag.tagName, icon: "tag", tag: tag)
        }
    }

    var body: some View {
        List(selection: $dataController.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilters, content: SmartFilterRow.init)
            }
            Section("Tags") {
                ForEach(tagFilters) { filter in
                    UserFilterRow(filter: filter, delete: delete, rename: rename)
                }
                .onDelete(perform: delete)
            }
            .alert("Rename tag", isPresented: $renamingTag) {
                Button("OK", action: completeRename)
                Button("Cancel", role: .cancel) { }
                TextField("New name", text: $tagName)
            }
            .sheet(isPresented: $showingAwards) {
                AwardsView()
            }
        }
        .navigationTitle("Filters")
        .toolbar {
            SideBarToolbarView(showingAwards: $showingAwards)
        }
    }

    func delete(_ offsets: IndexSet) {
        offsets.forEach { offset in
            let item = tags[offset]
            dataController.delete(item)
        }
    }

    func delete(_ filter: Filter) {
        guard let tag = filter.tag else { return }
        dataController.delete(tag)
        dataController.save()
    }

    func rename(_ filter: Filter) {
        tagToRename = filter.tag
        tagName = filter.name
        renamingTag = true
    }

    func completeRename() {
        tagToRename?.name = tagName
        dataController.save()
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SideBarView()
                .environmentObject(DataController.preview)
                .environment(\.managedObjectContext, DataController.preview.container.viewContext)
        }
    }
}
