//
//  ContentView.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import SwiftUI

struct LandsView: View {
    @State private var park = Park(lands: [Land](), rides: [Ride]())
    var themePark: CompanyPark

    var body: some View {
        NavigationStack {
            List(park.lands, id: \.id) { land in
                Section(header: Text(land.name).font(.headline).foregroundColor(.primary)) {
                    ForEach(land.rides, id: \.id) { ride in
                        HStack {
                            Text(ride.name)
                            Spacer()
                            ride.is_open ? Text("\(ride.wait_time) min") : Text("Closed").foregroundColor(.red)
                        }
                    }
                }
                .textCase(.none)
            }
            .listStyle(.sidebar)
            .navigationTitle(themePark.name)
            .task {
                await fetchData()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    func fetchData() async {
        // Create url
        guard let url = URL(string: "https://www.queue-times.com/en-US/parks/\(themePark.id)/queue_times.json") else {
            print("Invalid URL")
            return
        }

        // Fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // Decode data
            if let decodedResponse = try? JSONDecoder().decode(Park.self, from: data) {
                park = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(themePark: ParkData)
//    }
//}
