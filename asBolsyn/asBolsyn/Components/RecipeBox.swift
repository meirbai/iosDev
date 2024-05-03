//
//  RecipeBox.swift
//  asBolsyn
//
//  Created by Bissengali on 03.05.2024.
//

import SwiftUI

struct RecipeBox: View {
    let title: String
    let subtitle: String
    let url: String
    var body: some View {
        VStack {
            HStack{
                AsyncImage(url:URL(string: url)){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .frame(width: 100, height:120)
                        .padding(.leading, 20)
                        .aspectRatio(contentMode: .fit)
                }placeholder: {
                    Image("Image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height:120)
                        .padding(.leading, 20)
                }
                VStack(alignment:.leading){
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.subheadline)
                }
                .padding(.leading, 20)
                Spacer()
            }
        }
    }
}

struct RecipeBox_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBox(title: "Test", subtitle: "Test", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/The_Automobile_Association_logo.svg/1200px-The_Automobile_Association_logo.svg.png")
    }
}

