//
//  ContentView.swift
//  WaitTimes
//
//  Created by Hunter Dobbelmann on 9/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "timer")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .bold()

            Text("Wait Times")
                .font(.headline)
                .padding(.bottom)

            Text("This app shows the live wait times for popular theme parks around the world.")
                .font(.subheadline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
