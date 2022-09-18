//
//  CircleImage.swift
//  Crypto
//
//  Created by mac on 17/09/2022.
//

import SwiftUI

struct CircleImage: View {
    let ITEM_SIZE: CGFloat = 50
    let imageName: String
    var body: some View {
        Image(systemName: imageName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: ITEM_SIZE, height: ITEM_SIZE)
            .background(
                Circle()
                    .fill(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 5, x: 0, y: 0
            )
            .padding(10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "heart.fill")
            .previewLayout(.sizeThatFits)
    }
}
