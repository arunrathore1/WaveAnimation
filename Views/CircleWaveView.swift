//
//  CircleWaveView.swift
//  WaveAnimation
//
//  Created by Arun Rathore on 02/03/24.
//

import SwiftUI

struct CircleWaveView: View {
    @State private var waveOffset = Angle(degrees: 0)
    
    let percent: Int
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Text("\(self.percent)%")
                    .foregroundColor(.black)
                    .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height) ))
                Circle()
                    .stroke(Color.gray, lineWidth: 0.025 * min(geo.size.width, geo.size.height))
                    .overlay(
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                            .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                            .clipShape(Circle().scale(0.92))
                    )
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}
