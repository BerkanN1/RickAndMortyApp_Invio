//
//  MainView.swift
//  RickAndMorty
//
//  Created by BERKAN NALBANT on 23.04.2023.
//

import SwiftUI

struct  LaunchView: View {
    @State var isFirstLaunch: Bool = !UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
    
    var body: some View {
        VStack{
            ZStack{
            Image("rickandmorty")
                .resizable()
                Group{
                    if isFirstLaunch {
                        Text("Welcome!")
                            .font(.largeTitle)
                            .bold()
                            .italic()
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    } else {
                        Text("Hello!")
                            .font(.largeTitle)
                            .bold()
                            .italic()
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                .padding(.top,510)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
            }
             
                        
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
