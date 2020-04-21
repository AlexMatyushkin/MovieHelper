//
//  MovieCellModel.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//
import UIKit
import Combine

class MovieCellModel: ObservableObject {
    
    @Published var image: UIImage = UIImage()
    @Published var title: String = ""
    @Published var overview: String = ""
    @Published var rate: String = ""
    
    let apiService = APIService()
    var subsribers = Set<AnyCancellable>()
    
    init(movie: Movie?) {
        guard let movie = movie else { return }
        if let posterPath = movie.posterPath {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {
                apiService.loadImage(url: url).sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data in
                    guard let self = self else { return }
                    if let image = UIImage(data: data) {
                        self.image = image
                    }
                })
                    .store(in: &subsribers)
            } else {
                if let image = UIImage(named: "backgroundMovie") {
                    self.image = image
                }
            }
        } else {
            if let image = UIImage(named: "backgroundMovie") {
                self.image = image
            }
        }
        self.title = movie.title
        if let overview = movie.overview {
            self.overview = overview
        }
        
        self.rate = String(movie.voteAverage)
        
    }
}

