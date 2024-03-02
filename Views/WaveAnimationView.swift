//
//  WaveAnimationView.swift
//  WaveAnimation
//
//  Created by Arun Rathore on 02/03/24.
//

import SwiftUI

struct WaveAnimationView: View {
    @State private var percent = 0.0

    var body: some View {
        VStack {
            CircleWaveView(percent: Int(self.percent))
            Slider(value: self.$percent, in: 0...100)
        }
        .padding(.all)
    }
}
