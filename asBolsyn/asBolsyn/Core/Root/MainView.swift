//
//  MainView.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            HomepageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                    }
            ProfileView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Profile")
                    }
            SavedView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
                    }
        }
    }
}

#Preview {
    MainView()
}
