//
//  SearchbarView.swift
//  Crypto
//
//  Created by Amir Diafi on 12/6/22.
//

import SwiftUI

struct SearchbarView: View {
    @Binding var search_value: String
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    search_value.isEmpty ? .theme.secondaryText : .theme.accent
                )
            TextField("Search", text: $search_value)
                .autocorrectionDisabled(true)
                .foregroundColor(.theme.accent)
                .padding(.trailing, 35)
                .overlay(
                    Button(action: {
                        UIApplication.shared.endEditing()
                        search_value = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .offset(x: 10)
                            .opacity(search_value.count > 0 ? 1 : 0)
                            .animation(.easeIn, value: search_value)
                    },
                    alignment: .trailing
                )
                
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: .theme.accent.opacity(0.15), radius: 10)
        )
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchbarView(search_value: .constant(""))
                .preferredColorScheme(.light)
            SearchbarView(search_value: .constant(""))
                .preferredColorScheme(.dark)
        }
    }
}
