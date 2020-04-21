//
//  SearchMoviesView.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import SwiftUI

struct SearchMoviesView: View {
    
    @ObservedObject var model = SearchMoviesViewModel()
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                TextField("Введите название фильма", text: $model.movieName)
                    .padding([.leading, .top], 16)
            }
            List(model.movies) { movie in
                MovieCell(movie: movie)
            }
        
            Spacer()
        }
    }
}

struct SearchMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMoviesView()
    }
}
