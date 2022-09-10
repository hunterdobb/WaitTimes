//
//  ContentView.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var islandsOfAdv = Park(lands: [Land](), rides: [Ride]())

    var body: some View {
        NavigationStack {
            List(islandsOfAdv.lands, id: \.id) { land in
                NavigationLink(land.name, destination: RidesView(land: land))
            }
            .navigationTitle("Islands of Adventure")
            .task {
                await fetchData()
            }
        }
    }

    func fetchData() async {
        // Create url
        guard let url = URL(string: "https://www.queue-times.com/en-US/parks/64/queue_times.json") else {
            print("Invalid URL")
            return
        }

        // Fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // Decode data
            if let decodedResponse = try? JSONDecoder().decode(Park.self, from: data) {
                islandsOfAdv = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
