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
    @Binding var isPortflio: Bool
    
    var body: some View {
        HStack {
            ImageButton(
                imageName: leftIconName,
                action: leftAction)
            .background (
                AnimatedCircleView(isAnimation: $isPortflio)
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
            .rotationEffect(Angle(degrees: isPortflio ? 180 : 0))
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
            isPortflio: .constant(false)
        )
    }
}
