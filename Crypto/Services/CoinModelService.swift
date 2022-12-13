//
//  CoinModelService.swift
//  Crypto
//
//  Created by Amir Diafi on 12/3/22.
//

import Foundation
import Combine
import SwiftUI

func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    let notification = UINotificationFeedbackGenerator()
    notification.notificationOccurred(type)
}

class CoinModelService: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var isLoadingCoins = true
    @Published var loadingCoinsError: String? = nil
    
    var cancellableCoin: AnyCancellable?
    
    init() {
        self.getCoins()
    }
    
    func getCoins() {
        self.loadingCoinsError = nil
        self.isLoadingCoins = true
        
        let vs_currency = "usd"
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=\(vs_currency)&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=1h"
        guard let url = URL(string: urlString) else {
            isLoadingCoins = false
            loadingCoinsError = "Bad URL!"
            notification(type: .error)
            return
        }
        
        cancellableCoin = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    self.isLoadingCoins = false
                    self.loadingCoinsError = "Bad server response"
                    notification(type: .error)
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    // GOOD
                    break
                case .failure(let error):
                    // BAD
                    self.loadingCoinsError = error.localizedDescription.description
                    self.isLoadingCoins = false
                    notification(type: .error)
                    print(error.localizedDescription)
                }
                
            } receiveValue: {[weak self] data in
                self?.allCoins = data
                self?.cancellableCoin?.cancel()
                self?.isLoadingCoins = false
                notification(type: .success)
            }
    }
}
