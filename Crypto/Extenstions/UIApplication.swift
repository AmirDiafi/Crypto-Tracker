//
//  UIApplication.swift
//  Crypto
//
//  Created by Amir Diafi on 12/6/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
