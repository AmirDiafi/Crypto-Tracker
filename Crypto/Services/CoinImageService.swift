//
//  CoinImageService.swift
//  Crypto
//
//  Created by Amir Diafi on 12/5/22.
//

import Foundation
import Combine
import SwiftUI


class CoinImageService: ObservableObject {
    @Published var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable? = nil
    private let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        loadImage()
    }
    
    private func loadImage() {
        guard let url = URL(string: coin.image) else {
            print("bad url")
            return
        }
        
        imageSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { output -> UIImage? in
                guard let res = output.response as? HTTPURLResponse,
                      res.statusCode >= 200 && res.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return UIImage(data: output.data)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    // good
                    break
                case .failure(let error):
                    // bad
                    print("ERROR message\(error)")
                    break
                }
            } receiveValue: {[weak self] imageData in
                self?.image = imageData
                self?.imageSubscription?.cancel()
            }
    }
    
}
