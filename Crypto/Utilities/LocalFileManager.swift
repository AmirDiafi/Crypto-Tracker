//
//  M$LocalFileManager.swift
//  Crypto
//
//  Created by Amir Diafi on 12/8/22.
//

import Foundation
import SwiftUI

struct LocalFileManager {
    
    static let instance = LocalFileManager()
    
    init() { }
    
    func saveImage(image: UIImage) {
        
        guard let data = image.pngData(),
              let url = URL(string: "")
        else {
            return
        }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Failed to save file \(error)")
        }
        
    }
    
    private func getFileUrl(name: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {
            return nil
        }
        
        return url.appending(path: name)
    }
    
}
