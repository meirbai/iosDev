//
//  RecipeView.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import SwiftUI

struct RecipeView: View {
    let recNow: Recipe
    var body: some View {
        ScrollView{
            Text(recNow.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(recNow.subtitle)
                .font(.title2)
                .fontWeight(.bold)
            
            AsyncImage(url:URL(string: recNow.url)){image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height:240)
            }placeholder: {
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height:120)
            }
            
            Text(recNow.desc)
                .font(.title2)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
        }
    }
}

#Preview {
    RecipeView(recNow: Recipe(id: 1, title: "Pasta", desc: """
Ingredients:
    
    200g spaghetti
    2 chicken breasts, thinly sliced
    2 tbsp olive oil
    4 garlic cloves, minced
    Zest and juice of 1 lemon
    1/2 cup chicken broth
    1/2 cup grated Parmesan
    Salt and pepper
    Fresh parsley, chopped

Instructions:

    Cook pasta in salted boiling water according to package instructions. Drain, reserving 1/4 cup pasta water.
    Heat 1 tbsp oil in a pan over medium heat. Season chicken with salt and pepper, cook until golden and cooked through, about 5-6 minutes. Remove and set aside.
    In the same pan, add remaining oil and garlic, sauté for 1 minute. Add lemon zest, juice, and chicken broth, simmer for 2 minutes.
    Return chicken to the pan, add cooked pasta, Parmesan, and reserved pasta water. Toss until sauce thickens and coats pasta.
    Garnish with parsley and serve immediately. Enjoy!
""", subtitle: "Italian", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjgVPPuLjxgzTT8opvS1O6bevU0_WsMEZt3JMHvsQ8lw&s"))
}
