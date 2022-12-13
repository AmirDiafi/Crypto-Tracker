//
//  CoinItemView.swift
//  Crypto
//
//  Created by Amir Diafi on 11/29/22.
//

import SwiftUI

struct CoinItemView: View {
    
    var coin: Coin
    var showHoldingsColumn: Bool
    
    var body: some View {
        HStack {
            leftColumn
            Spacer()
            if showHoldingsColumn{
                middleColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoinItemView(coin: dev.coin, showHoldingsColumn: true)
    }
}

extension CoinItemView {
        private var leftColumn: some View {
            VStack(alignment: .leading) {
                HStack{
                    Text("\(coin.rank)")
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                    CoinImage(coin: coin)
                        .frame(width: 30, height: 30)
                    Text(coin.symbol.uppercased())
                        .fontWeight(.bold)
                    Spacer()
                }
            }
       }
    
    
    private var middleColumn: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
                .bold()
                .foregroundColor(Color.theme.secondaryText)
        }
        
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(
                String(coin.currentPrice.asCurrencyWith2Decimals())
            )
            .bold()
            Text(
                String(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                
            )
            .foregroundColor(
                (coin.priceChangePercentage24H ?? 0) >= 0
                ? Color.theme.green
                : Color.theme.red
            )
            .bold()
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
