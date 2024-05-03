//
//  HomepageView.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import SwiftUI

struct Recipe: Codable {
    let id: Int
    let title: String
    let desc: String
    let subtitle: String
    let url: String
}

var saved = [Recipe]()

struct SavedView: View {
    var body: some View {
        Text("Saved Recipes")
        NavigationStack{
            List(saved, id: \.id) {recipe in
                NavigationLink{
                    RecipeView(recNow: recipe)
                }label: {
                    RecipeBox(title: recipe.title, subtitle: recipe.subtitle, url: recipe.url)
                        .foregroundColor(.black)
                }
                Button {
                    saved.append(recipe)
                } label: {
                    Text("Delete")
                }
                .zIndex(3)
                .padding(.leading, 135)
            }
            Spacer()
        }
    }
}

struct HomepageView: View {
    @State var recipes = [Recipe]()
    var body: some View {
        NavigationStack{
            List(recipes, id: \.id) {recipe in
                NavigationLink{
                    RecipeView(recNow: recipe)
                }label: {
                    RecipeBox(title: recipe.title, subtitle: recipe.subtitle, url: recipe.url)
                        .foregroundColor(.black)
                }
                Button {
                    if !saved.contains(where: { $0.id == recipe.id }) {
                                            saved.append(recipe)
                                        }
                } label: {
                    Text("SAVE")
                }
                .zIndex(3)
                .padding(.leading, 135)
            }
            .task {
                await fetchData()
            }
            Spacer()
        }
    }
    
    func fetchData() async{
        guard let url = URL(string: "http://127.0.0.1:8000/recipe/") else{return}
                
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Recipe].self, from: data){
                recipes = decodedResponse
            }
                
        }catch{
            
        }
    }
}

#Preview {
    HomepageView()
}
