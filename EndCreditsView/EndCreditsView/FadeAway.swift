//
//  FadeAway.swift
//  EndCreditsView
//
//  Created by Shin yongjun on 2022/06/14.
//


import SwiftUI

struct StartWarsView: View {
    private let startAnimationDuration = 5.0
    @State private var animationStart = false
    var body: some View {
        GeometryReader { geometry in
            Text("A long time ago, in a galaxy far, far away... It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.")
                .fontWeight(.black)
                .font(Font.custom("System", size: 28))
                .foregroundColor(.yellow)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .padding()
            
                .rotation3DEffect(.degrees(30), axis: (x:1, y:0, z:0))
                .shadow(color: .gray, radius: 1, x: 1, y: 10)
                .frame(width: 300, height: self.animationStart ? geometry.size.height : 0)
                .animation(Animation.linear(duration: self.startAnimationDuration))
                .onAppear() {
                    self.animationStart.toggle()
            }
        }
    }
}

struct StartWarsView_Previews: PreviewProvider {
    static var previews: some View {
        StartWarsView()
    }
}
