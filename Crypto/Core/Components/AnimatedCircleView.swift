//
//  AnimatedCircleView.swift
//  Crypto
//
//  Created by mac on 18/09/2022.
//

import SwiftUI

struct AnimatedCircleView: View {
    @Binding var isAnimation: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scaleEffect(isAnimation ? 1 : 0)
            .opacity(isAnimation ? 0 : 1)
            .animation(isAnimation ? .easeOut(duration: 1.0) : .none)
    }
}

struct AnimatedCircleView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCircleView(isAnimation: .constant(false))
            .frame(width: 150, height: 150)
    }
}
