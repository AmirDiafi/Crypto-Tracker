//
//  ErrorView.swift
//  Crypto
//
//  Created by Amir Diafi on 12/3/22.
//

import SwiftUI

struct ErrorView: View {
    var error: String?
    var retry: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .center) {
            Text("⚠️")
                .font(.system(size: 70))
                .padding(.bottom, 5)
            
            Text("Waza!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.theme.accent)
                .padding(.bottom ,2)
            
            Text(
                error?.lowercased()
                 ??
                 "something went wrong, please check your internet and try again"
            )
                .font(.subheadline)
                .bold()
                .foregroundColor(.theme.secondaryText)
                .multilineTextAlignment(.center)
            
            
            Button(action: {
                (retry ?? {
                    // retry nothing
                    print("RETRY NOTHING ❌")
                })()
            }) {
                Text("Retry")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 150)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(30)
                    .shadow(radius: 4)
                
            }
            .padding(.top, 30)
        }
        .frame(width: 300, height: 300, alignment:.center)
        .shadow(color: Color.theme.background.opacity(0.5), radius: 10)
        .cornerRadius(10)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
