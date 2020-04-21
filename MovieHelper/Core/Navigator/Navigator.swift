//
//  Navigator.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import SwiftUI

class Navigator {
    
   static func makeModule(_ module: Module) -> AnyView {
        switch module {
        case .splashScreen:
           return AnyView(SplashView())
            
        case .mainView:
            return AnyView(MainView())
        }
    }
}
