//
//  ParksView.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import SwiftUI

struct ParksView: View {
    var company: Company

    var body: some View {
        NavigationStack {
            List(company.parks, id: \.id) { park in
                NavigationLink(park.name, destination: LandsView(themePark: park))
            }
            .navigationTitle(company.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct ParksView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParksView()
//    }
//}
