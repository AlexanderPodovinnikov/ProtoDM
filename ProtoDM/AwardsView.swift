//
//  AwardsView.swift
//  ProtoDM
//
//  Created by Alex Po on 10.04.2023.
//

import SwiftUI

struct AwardsView: View {
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 80, maximum: 80))]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Award.allAwards) { award in
                        Button {
                            // no action yet
                        } label: {
                            Image(systemName: award.image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.secondary.opacity(0.5))
                        }
                    }
                }
            }
            .navigationTitle("Awards")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
