//
//  ProtoDMApp.swift
//  ProtoDM
//
//  Created by Alex Po on 18.03.2023.
//

import SwiftUI

@main
struct ProtoDMApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SideBarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
