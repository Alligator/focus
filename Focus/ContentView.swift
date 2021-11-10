//
//  ContentView.swift
//  Focus
//
//  Created by alligator on 10/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var distractions = 0
    
    var body: some View {
        VStack(spacing: 0.0) {
            Text("Focus!")
                .font(.system(size: 60))
                .fontWeight(.bold)
            Text("You've been distracted \(distractions) times")
                .padding()
            Button("Reset") {
                distractions = 0
            }
        }
        .padding(10.0)
        .preferredColorScheme(.dark)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
            distractions += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
