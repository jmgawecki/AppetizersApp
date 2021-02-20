//
//  ContentView.swift
//  Shared
//
//  Created by Jakub Gawecki on 20/02/2021.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: SFSymbolsAsString.homePage)
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: SFSymbolsAsString.account)
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: SFSymbolsAsString.order)
                    Text("Order")
                }
        }
        .accentColor(Color(CustomColors.brandPrimary))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
