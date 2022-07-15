//
//  TrafficSignalView.swift
//  UITrafficLights
//
//  Created by Kislov Vadim on 14.07.2022.
//

import SwiftUI

struct TrafficSignalView: View {
    public var color: Color
    public var opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(color)
            .opacity(opacity)
    }
}

struct TrafficSignalView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficSignalView(color: .red, opacity: 0.3)
    }
}
