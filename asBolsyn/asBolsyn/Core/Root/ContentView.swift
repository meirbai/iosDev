//
//  ContentView.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if viewModel.userSession != nil{
            MainView()
        }else{
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
