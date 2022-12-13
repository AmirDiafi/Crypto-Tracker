//
//  PreviewProvider.swift
//  Crypto
//
//  Created by Amir Diafi on 11/29/22.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let statistic_1 = StatisticModel(title: "Market cap", value: "$25.58n", percentageChange: 23.44)
    let statistic_2 = StatisticModel(title: "Total volume", value: "$1.34Tr", percentageChange: 23.44)
    let statistic_3 = StatisticModel(title: "Portfolio value", value: "$45.5k", percentageChange: -13.44)
    
    private init() { }
    
    let coin = Coin(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 16433.45,
        marketCap: 315772282209,
        marketCapRank: 1,
        fullyDilutedValuation: 345015087418,
        totalVolume: 24364516593,
        high24H: 16541.11,
        low24H: 16157.9,
        priceChange24H: 203.51,
        priceChangePercentage24H: 1.25394,
        marketCapChange24H: 4466914551,
        marketCapChangePercentage24H: 1.4349,
        circulatingSupply: 19220081.0,
        totalSupply: 21000000.0,
        maxSupply: 21000000.0,
        ath: 69045,
        athChangePercentage: -76.19517,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 24138.65061,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2022-11-29T19:53:27.928Z",
        sparklineIn7D: SparklineIn7D(price: [
            16150.128749164089,
            16191.113745792902,
            16161.282188136152
        ]),
        priceChangePercentage24HInCurrency: 1.253942457153319,
        currentHoldings: 1.5
    )
    
    let vm = HomeViewModel()
}
