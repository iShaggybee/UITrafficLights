//
//  ContentView.swift
//  UITrafficLights
//
//  Created by Kislov Vadim on 14.07.2022.
//

import SwiftUI

enum TrafficSignal {
   case red
   case orange
   case green
}

struct ContentView: View {
    @State private var currentTrafficSignal: TrafficSignal?
    @State private var buttonText = "Start"
    @State private var isReverse = false
    
    var body: some View {
        VStack {
            VStack(spacing: 16.0) {
                TrafficSignalView(color: .red,
                                  opacity: currentTrafficSignal == .red ? 1 : 0.3)
                TrafficSignalView(color: .orange,
                                  opacity: currentTrafficSignal == .orange ? 1 : 0.3)
                TrafficSignalView(color: .green,
                                  opacity: currentTrafficSignal == .green ? 1 : 0.3)
            }
            .padding(20)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Spacer()
            
            Button(action: changeTrafficSignal) {
                Text(buttonText)
                    .font(.title)
            }
        }
        .padding(40)
    }
    
    private func changeTrafficSignal() {
        buttonText = "Next"
        
        switch currentTrafficSignal {
        case .none:
            currentTrafficSignal = .red
        case .red:
            isReverse = false
            currentTrafficSignal = .orange
        case .orange:
            currentTrafficSignal = isReverse ? .red : .green
        case .green:
            isReverse = true
            currentTrafficSignal = .orange
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
