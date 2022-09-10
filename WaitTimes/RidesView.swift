//
//  RidesView.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import SwiftUI

struct RidesView: View {
    var land: Land

    var body: some View {
        NavigationStack {
            List(land.rides, id: \.id) { ride in
                HStack {
                    Text(ride.name)
                    Spacer()
                    ride.is_open ? Text("\(ride.wait_time) min") : Text("Closed").foregroundColor(.red)
                }
            }
            .navigationTitle(land.name)
        }
    }
}

//struct RidesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RidesView()
//    }
//}
