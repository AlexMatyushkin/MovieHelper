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
                .font(Font.custom("SFProText-Bold", size: 20))
                .multilineTextAlignment(.center)
            
            VStack{
                HStack{
                    Spacer()
                    Image.init(uiImage: model.image).resizable()
                        .frame(width: 150, height: 200, alignment: .center)
                    Spacer()
                }
                
                Text(model.raleaseDate ?? "")
                
                HStack {
                    Text("Рейтинг: \(model.rate)")
                        .fontWeight(.medium)
                        .foregroundColor(model.rateColor)
                    
                    Image(model.imageRateName ?? "")
                }
                .padding([.top, .bottom], 16)
                
                if model.overview != "" {
                    Text("Краткое описание").fontWeight(.bold)
                        .padding([.top, .bottom], 16)
                    Text(model.overview)
                    
                }
                
            }
            
        }
        
    }
    
    init(movie: Movie?) {
        self.model = MovieCellModel(movie: movie)
    }
}
