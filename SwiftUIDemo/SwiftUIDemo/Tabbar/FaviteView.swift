//
//  FaviteView.swift
//  SwiftUIDemo
//
//  Created by BeLocum-6 on 12/06/24.
//

import SwiftUI

struct FaviteView: View {
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom,40)
            
            Text("Hobbies")
                .font(.title2)
            
            HStack {
                ForEach(information.hobbies, id: \.self) { hobby in
                   Image(systemName: hobby)
                        .resizable()
                        .frame(maxWidth: 40,maxHeight: 40)
                        .padding()
                }

            }
            .padding()

            
            Text("Foods")
                .font(.title2)
            
            HStack(spacing: 50) {
                ForEach(information.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 40))
                }
            }
            .padding()
            
            Text("Favorite Colors")
                .font(.title2)
            
            HStack (spacing:10) {
                ForEach(information.colors, id: \.self) { color in
                    color.frame(width: 70,height: 70)
                        .cornerRadius(10)
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    FaviteView()
}
