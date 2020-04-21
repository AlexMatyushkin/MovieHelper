//
//  SearcMoviesViewModel.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Combine

class SearchMoviesViewModel: ObservableObject {
   
    @Published var movieName = "" {
        didSet{
            if self.movieName.count < 1 {
                self.movies.removeAll()
            } else {
                self.getMovies(movieTitle: self.movieName)
            }
        }
    }
    
    var subscriptions = Set<AnyCancellable>()
    let service = APIService()
    
    @Published var movies: [Movie] = []
    
    func getMovies(movieTitle: String) {
        service.searchMovies(movieName: movieTitle)?
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.movies = value.results
            })
            .store(in: &subscriptions)
        
    }
}
