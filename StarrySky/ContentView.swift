//
//  ContentView.swift
//  StarrySky
//
//  Created by Mayara Mendonça de Souza on 27/08/21.
//

import SwiftUI

struct Star: View {
    @State var scale: CGFloat = 1
    
    let starColors : [Color] = [Color(#colorLiteral(red: 0.3632582426, green: 0.1862013042, blue: 0.6553688645, alpha: 1)), Color(#colorLiteral(red: 0.72285074, green: 0.5961747169, blue: 0.8189096451, alpha: 1))]
    let duration = Double.random(in: 1.0..<1.2)
    
    var body: some View {
        Image(systemName: "sparkle")
            .foregroundColor(starColors.randomElement())
            .scaleEffect(scale)
            .font(.system(size: CGFloat.random(in: 30..<35), weight: .black))
            
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                
                withAnimation(repeated) {
                    scale = CGFloat.random(in: 0.3..<0.7)
                }
            }
        
    }
    
}

struct ContentView: View {
    
    let bgColor = #colorLiteral(red: 0.2054183185, green: 0.08943314105, blue: 0.4286007285, alpha: 1)
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color(bgColor).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ForEach(0..<10) { index in
                Star()
                    .position(x: CGFloat.random(in: 0...width), y: CGFloat.random(in: 0...height))
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
