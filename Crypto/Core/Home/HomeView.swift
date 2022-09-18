//
//  HomeView.swift
//  Crypto
//
//  Created by mac on 17/09/2022.
//

import SwiftUI

struct HomeView: View {
    @State var isPortflio: Bool = false
    var body: some View {
        ZStack {
            //Background Layer
            Color.theme.background.ignoresSafeArea()
            VStack {
                //Header Section
                homeHeader
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension HomeView {
    private var homeHeader: some View {
        Header(
            rightIconName: "chevron.right" ,
            leftIconName: isPortflio ? "plus" : "info",
            rightAction: {
                withAnimation(.easeInOut) {
                    isPortflio.toggle()
                }
            },
            leftAction: {
                print("DO SOMETHING")
            },
            title: isPortflio ? "Portfolio" : "Live Prices",
            isPortflio: $isPortflio
        )
    }
}
