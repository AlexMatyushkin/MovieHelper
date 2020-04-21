//
//  MainView.swift
//  MovieHelper
//
//  Created by 17503583 on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            SearchMoviesView()
                .tabItem {
                    Text("Search Movies")
            }
            
            Text("Search actors")
                .tabItem {
                    Text("Search actors")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
