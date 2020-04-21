//
//  MainView.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            SearchMoviesView()
                .tabItem {
                    VStack{
                        Text("Movies")
                    }
                    
            }
            
            Text("Search actors")
                .tabItem {
                    Text("Actors")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
