//
//  MovieCell.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    
    @ObservedObject var model: MovieCellModel
    
    var body: some View {
       VStack{
            Text(model.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            VStack{
                HStack{
                    Spacer()
                    Image.init(uiImage: model.image).resizable()
                        .frame(width: 150, height: 200, alignment: .center)
                    Spacer()
                }
                Text("Рейтинг: \(model.rate)")
                if model.overview != "" {
                    Text("Краткое описание").fontWeight(.bold)
                    Text(model.overview)
                }
                
            }
        }
    }
    
    init(movie: Movie?) {
        self.model = MovieCellModel(movie: movie)
    }
}
