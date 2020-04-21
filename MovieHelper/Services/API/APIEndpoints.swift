//
//  APIEndpoints.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import Foundation

enum Endpoint {
    case searchMovies
    case detailedInfo
    
    var endpoint: URLComponents {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.themoviedb.org"
        
        switch self {
        case .searchMovies:
            component.path = "/3/search/movie"
        case .detailedInfo:
             component.path = "/3/movie/"
        }
        
        return component
    }
}
