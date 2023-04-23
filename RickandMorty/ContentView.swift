//
//  ContentView.swift
//  RickandMorty
//
//  Created by BERKAN NALBANT on 23.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    LocationViews(location: locationDummyData)

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
