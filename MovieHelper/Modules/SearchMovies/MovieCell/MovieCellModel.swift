//
//  MovieCellModel.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//
import SwiftUI
import Combine

class MovieCellModel: ObservableObject {
    
    @Published var image: UIImage = UIImage()
    @Published var title: String = ""
    @Published var overview: String = ""
    @Published var rate: String = ""
    @Published var rateColor: Color?
    @Published var imageRateName: String?
    @Published var raleaseDate: String?
    
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
        setupRateSettings(rate: movie.voteAverage)
        
        raleaseDate = makeRaleaseDateString(date: movie.releaseDate)
    }
    
    func setupRateSettings(rate: Double) {
        switch rate {
        case 0:
            break
        case 1...4:
            rateColor = Color.red
            imageRateName = "bad"
        case 4...7:
            rateColor = Color.yellow
        default:
            rateColor = Color.green
            imageRateName = "good"
        }
    }
    
    func makeRaleaseDateString(date: String?) -> String? {
        guard let date = date else { return "" }
        let year = date.prefix(4)
        return "Фильм вышел в " + year + " году"
    }
}

