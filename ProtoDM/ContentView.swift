//
//  ContentView.swift
//  ProtoDM
//
//  Created by Alex Po on 18.03.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
  

    var body: some View {
        List(selection: $dataController.selectedIssue) {
            ForEach(dataController.issuesForSelectedFilter()) { issue in
                IssueRow(issue: issue)
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Issues")
        .searchable(text: $dataController.filterText, tokens: $dataController.filterTokens, suggestedTokens: .constant(dataController.suggestedFilterTokens), prompt: "Filter text, start with # to add tags") { tag in
            Text(tag.tagName)
        }
    }

    func delete(_ offsets: IndexSet) {
        let issues = dataController.issuesForSelectedFilter()
        offsets.forEach { offset in
            let item = issues[offset]
            dataController.delete(item)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(DataController.preview)
                .environment(\.managedObjectContext, DataController.preview.container.viewContext)
        }
    }
}

