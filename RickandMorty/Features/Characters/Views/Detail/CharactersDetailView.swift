//
//  CharactersDetailView.swift
//  RickAndMorty
//
//  Created by Doni on 3/2/23.
//

import SwiftUI

struct CharactersDetailView: View {
    
    @State var character: Character
    
    var body: some View {
        ScrollView {
            VStack {
                
                VStack(spacing: 41.0) {
                    Spacer()
                    AsyncImage(url: URL(string: character.image)) { image in
                        
                        image
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(45)
                           
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                    VStack{
                        CharacterInfoView(character: character)
                    }
                    .padding(.top)
                }
                .padding(.top)
                
              
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .ignoresSafeArea(.all)
    }
}

struct CharactersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersDetailView(character: characterDummyData)
    }
}
