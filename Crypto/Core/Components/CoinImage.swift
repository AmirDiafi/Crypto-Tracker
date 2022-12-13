//
//  CoinImage.swift
//  Crypto
//
//  Created by Amir Diafi on 12/5/22.
//

import SwiftUI

struct CoinImage: View {
    @StateObject var vm: CoinImageViewModel
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView()
            } else if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.theme.secondaryText)
            }
        }
    }
}

struct CoinImage_Previews: PreviewProvider {
    static var previews: some View {
        CoinImage(coin: dev.coin)
    }
}
