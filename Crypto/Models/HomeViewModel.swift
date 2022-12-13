//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Amir Diafi on 12/2/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var isLoadingCoins = true
    @Published var loadingCoinsError: String? = nil
    @Published var searchValue: String = ""
    
    let dataService = CoinModelService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        subscribe()
    }
    
    private func subscribe() {
        // Updates allCoins
        dataService.$allCoins
            .combineLatest($searchValue)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filteringCoins)
            .sink {[weak self] coins_data in
                self?.allCoins = coins_data
            }
            .store(in: &cancellables)
        
        dataService.$isLoadingCoins.sink {[weak self] loading in
            self?.isLoadingCoins = loading
        }
        .store(in: &cancellables)
        
        dataService.$loadingCoinsError.sink {[weak self] error_message in
            self?.loadingCoinsError = error_message
        }
        .store(in: &cancellables)
    }
    
    private func filteringCoins(coins: [Coin], text: String) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        let search = text.lowercased()
        let filtered = coins.filter { coin in
            return coin.name.lowercased().contains(search) ||
            coin.symbol.lowercased().contains(search) ||
            coin.id.lowercased().contains(search)
        }
        return filtered
    }
    
}
