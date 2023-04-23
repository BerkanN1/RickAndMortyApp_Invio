//
//  LocationViews.swift
//  RickAndMorty
//
//  Created by Berkan Nalbant
//

import SwiftUI

struct LocationViews: View {
    @StateObject var locationsVM = LocationsViewModel()
    @State private var hasAppeared = false
    @State private var characters: [Character] = []
    @State var location: Location
    @State private var selectedLocation: Location?
    
    var body: some View {
        NavigationStack {
            VStack{
                Divider()
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top){
                        ForEach(locationsVM.locations){ location in
                            Button(action: {
                                locationButtonTapped(location)
                                
                            }){
                                Text(location.name)
                                    .task {
                                        if locationsVM.hasReachedEnd(of: location) {
                                            await locationsVM.getNextSetOfLocations()
                                        }
                                    }
                                
                            }
                            .buttonStyle(
                                CombinedButtonStyle(
                                    isSelected: selectedLocation == location
                                )
                            )
                        }
                        
                    }
                    
                }.padding(.all)
                ScrollView {
                    if characters.isEmpty{
                        VStack(alignment: .center){
                            Image("dss")
                                .padding(.bottom)
                            Text("Choose a location")
                                .font(.title)
                                .padding(.top)
                                .bold()
                        }
                    }else{
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                            ForEach(characters) { character in
                                NavigationLink {
                                    CharactersDetailView(character: character)
                                } label: {
                                    HStack{
                                        HStack{
                                            
                                            AsyncImage(url: URL(string: character.image)) { image in
                                                image
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .clipShape(Circle())
                                            } placeholder: {
                                                
                                                ProgressView()
                                                    .clipShape(Circle())
                                            }
                                            VStack{
                                                
                                                Text(character.name)
                                                    .font(.title2)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Text(character.gender.rawValue)
                                                    .font(.title3)
                                                    .italic()
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        Spacer()
                                        
                                        
                                        VStack{
                                            
                                            if(character.gender.rawValue == "Male"){
                                                Image("male")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }else if(character.gender.rawValue == "Female"){
                                                Image("female")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }else{
                                                Image("unknown")
                                                    .resizable()
                                                    .frame(width: 90, height: 90)
                                                
                                            }
                                        }
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 16)
                                
                            }
                        }
                        
                    }
                }
                
                
                .task {
                    if !hasAppeared {
                        await locationsVM.getAllLocations()
                        hasAppeared = true
                    }
                }
                .navigationTitle("Rick＆Morty")
                .toolbarBackground(.hidden, for: .navigationBar)
                
                
            }
            
        }
        
    }
    func locationButtonTapped(_ location: Location) {
        selectedLocation = location
        Task {
            characters = await locationsVM.getLocationCharacters(location: location)
        }
    }
    
        
}


struct LocationViews_Previews: PreviewProvider {
    static var previews: some View {
        LocationViews(location: locationDummyData)
    }
}
