//
//  AwardsView.swift
//  ProtoDM
//
//  Created by Alex Po on 10.04.2023.
//

import SwiftUI

struct AwardsView: View {
    @EnvironmentObject var dataController: DataController
    @State private var selectedAward = Award.example
    @State private var showingAwardDetails = false

    var awardTitle: String {
        if dataController.hasEarned(award: selectedAward) {
            return "Unlocked: \(selectedAward.name)"
        } else {
            return "Locked"
        }
    }

    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 80, maximum: 80))]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Award.allAwards) { award in
                        Button {
                            selectedAward = award
                            showingAwardDetails = true
                        } label: {
                            Image(systemName: award.image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 80, height: 80)
                                .foregroundColor(color(for: award))
                        }
                    }
                }
            }
            .navigationTitle("Awards")
        }
        .alert(awardTitle, isPresented: $showingAwardDetails) {
            // only message
        } message: {
            Text(selectedAward.description)
        }
    }

    func color(for award: Award) -> Color {
        dataController.hasEarned(award: award)
                         ? Color(award.color)
                         : .secondary.opacity(0.5)
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
            .environmentObject(DataController.preview)
    }
}
