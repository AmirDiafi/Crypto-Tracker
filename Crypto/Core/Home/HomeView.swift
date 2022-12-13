//
//  HomeView.swift
//  Crypto
//
//  Created by mac on 17/09/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State var isPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // MARK: Background Layer
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                //Header Section
                homeHeader
                SearchbarView(search_value: $vm.searchValue)
                    .padding()
                if vm.isLoadingCoins {
                    Spacer()
                    ProgressView()
                        .scaleEffect(2)
                    Spacer()
                    
                } else if vm.loadingCoinsError != nil{
                    Spacer()
                    ErrorView(error: vm.loadingCoinsError, retry: vm.dataService.getCoins)
                    Spacer()
                } else {
                    // MARK: Items
                    columnTitles
                    if !isPortfolio {
                        if vm.allCoins.count > 0 {
                            homeList
                        } else {
                            Spacer()
                            emptyMessage
                            Spacer()
                        }
                    } else if isPortfolio {
                        if vm.portfolioCoins.count > 0 {
                            portfolioList
                        } else {
                            Spacer()
                            emptyMessage
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.vm)
    }
}


extension HomeView {
    private var homeHeader: some View {
        Header(
            rightIconName: "chevron.right" ,
            leftIconName: isPortfolio ? "plus" : "info",
            rightAction: {
                withAnimation(.easeInOut) {
                    isPortfolio.toggle()
                }
            },
            leftAction: {
                print("DO SOMETHING")
            },
            title: isPortfolio ? "Portfolio" : "Live Prices",
            isPortfolio: $isPortfolio
        )
    }
    
    private var emptyMessage: some View {
        VStack {
            Text("😕")
                .font(.system(size: 60))
            Text("No items!")
                .font(.title)
                .foregroundColor(Color.theme.secondaryText)
                .fontWeight(.semibold)
        }
        .transition(.opacity)
    }
    
    private var portfolioList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinItemView(coin: coin, showHoldingsColumn: isPortfolio)
            }
            
        }
        .listStyle(.plain)
        .transition(
            .asymmetric(
                insertion: .move(edge: .leading),
                removal: .move(edge: .leading)
            )
        )
    }
    
    private var homeList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinItemView(coin: coin, showHoldingsColumn: false)
            }
        }
        .listStyle(.plain)
        .transition(
            .asymmetric(
                insertion: .move(edge: .trailing),
                removal: .move(edge: .trailing)
            )
        )
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if isPortfolio {
                Text("Holding")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.subheadline)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal, 20)
    }
}
