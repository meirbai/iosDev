//
//  asBolsynApp.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import SwiftUI
import Firebase

@main
struct asBolsynApp: App {
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
