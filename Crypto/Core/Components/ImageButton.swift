//
//  ImageButton.swift
//  Crypto
//
//  Created by mac on 17/09/2022.
//

import SwiftUI

struct ImageButton: View {
    let imageName: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            CircleImage(imageName: imageName)
        }
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(
            imageName: "heart.fill",
            action: {
                print("BUTTON CLICKED")
            })
    }
}
