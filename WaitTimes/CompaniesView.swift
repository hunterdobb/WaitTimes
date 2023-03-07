//
//  ParksView.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import SwiftUI

struct CompaniesView: View {
    @State private var companies = [Company]()
    

    var body: some View {
        NavigationStack {
            List(companies, id: \.id) { company in
                Section(header: Text(company.name).font(.headline).foregroundColor(.primary)) {
                    ForEach(company.parks, id: \.id) { companyPark in
                        NavigationLink(companyPark.name, destination: LandsView(themePark: companyPark))
                    }
                }
                .textCase(.none)
            }
            .listStyle(.sidebar)
            .navigationTitle("All Parks")
            .task {
                await fetchData()
            }
        }
    }

    // Put this in the view model
    func fetchData() async {
        // Create url
        guard let url = URL(string: "https://queue-times.com/en-US/parks.json") else {
            print("Invalid URL")
            return
        }

        // Fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // Decode data
            if let decodedResponse = try? JSONDecoder().decode([Company].self, from: data) {
                companies = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
        CompaniesView()
    }
}
