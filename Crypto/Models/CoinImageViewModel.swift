//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by Amir Diafi on 12/5/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading = false
    
    private let service: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    
    init(coin: Coin) {
        self.isLoading = true
        self.service =  CoinImageService(coin: coin)
        self.subscribeToImage()
    }
    
    private func subscribeToImage() {
        service.$image.sink {[weak self] image in
            self?.image = image
            self?.isLoading = false
        }
        .store(in: &cancellables)
    }
    
}
