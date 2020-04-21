//
//  SplashViewModel.swift
//  MovieHelper
//
//  Created by 17503583 on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var appName = ""
    @Published var version = ""
        
    init() {
        appName = "Movie Helper"
        version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
    }
    
    func startCloseTimer() {
        let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] _ in
            self?.closeSplashScreen()
        }
    }
    
    private func closeSplashScreen() {
           UIApplication.shared.windows.first?
            .rootViewController = UIHostingController(rootView: Navigator.makeModule(.mainView))
       }
}
