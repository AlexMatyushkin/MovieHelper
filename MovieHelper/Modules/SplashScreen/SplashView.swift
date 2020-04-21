//
//  ContentView.swift
//  MovieHelper
//
//  Created by Aleksey Matyushkin on 21.04.2020.
//  Copyright © 2020 Aleksey Matyushkin. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var model = SplashViewModel()
    
    @State var degrees =  0.0
    
    var repeatingAnimation: Animation {
        Animation.easeInOut(duration: 1.5).repeatForever()
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: 50)
            
            Section {
                Image("movieIcon")
                    .padding(.all, 30)
            }
            .background(Colors.mainColor)
            .cornerRadius(80)
            .overlay(
                RoundedRectangle(cornerRadius: 80)
                    .stroke(Color.white, lineWidth: 10)
            )
                .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 1, z: 1))
                .onAppear {
                    withAnimation(self.repeatingAnimation) {
                        self.degrees += 360
                    }
            }
            
            HStack {
                Spacer()
                Text(model.appName)
                    .padding(.top, 20)
                Spacer()
            }
            
            
            Spacer()
            
            Text("Версия: \(model.version)")
                .padding(.bottom, 10)
        }
        .background(Colors.grey40)
        .onAppear {
            self.model.startCloseTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
