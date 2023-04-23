//
//  CharacterInfoView.swift
//  RickAndMorty
//
//  Created by Doni on 3/3/23.
//

import SwiftUI

struct CharacterInfoView: View {
    @State var character: Character
    
    func getStatusColor() -> Color {
        switch character.status {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    
                
                Spacer()
                
                Circle()
                    .frame(height: 15)
                    .foregroundColor(getStatusColor())
                Text(character.status.rawValue)
                    .font(.headline)
                    .fontWeight(.heavy)
                    
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Species:")
                        .font(.title3)
                        .fontWeight(.medium)
                       
                    Text(character.species)
                        
                }
                
                HStack {
                    Text("Gender:")
                        .font(.title3)
                        .fontWeight(.medium)
                        
                    Text(character.gender.rawValue)
                        
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Last known location:")
                            .font(.title3)
                            .fontWeight(.medium)
                            
                        Text(character.origin.name)
                    }
                    HStack {
                        Text("First seen in:")
                            .font(.title3)
                            .fontWeight(.medium)
                           
                        Text(character.location.name)
                    }
                    
                }
            }
        }
        .padding()
       
    }
}

struct CharacterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoView(character: characterDummyData)
    }
}
