//
//  Header.swift
//  Crypto
//
//  Created by mac on 17/09/2022.
//

import SwiftUI

struct Header: View {
    let rightIconName: String
    let leftIconName: String
    let rightAction: () -> Void
    let leftAction: () -> Void
    let title: String
    @Binding var isPortfolio: Bool
    
    var body: some View {
        HStack {
            ImageButton(
                imageName: leftIconName,
                action: leftAction)
            .background (
                AnimatedCircleView(isAnimation: $isPortfolio)
            )
            Spacer()
            Text(title)
                .font(.headline)
                .fontWeight(.heavy)
                .animation(.none)
            Spacer()
            ImageButton(
                imageName: rightIconName,
                action: rightAction)
            .rotationEffect(Angle(degrees: isPortfolio ? 180 : 0))
        }
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(
            rightIconName: "chevron.right",
            leftIconName: "info",
            rightAction: {
                print("Right Clicked")
            },
            leftAction: {
                print("Left Clicked")
            },
            title: "Live Prices",
            isPortfolio: .constant(false)
        )
    }
}
