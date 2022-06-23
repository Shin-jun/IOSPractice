//
//  EndCredits.swift
//  EndCreditsView
//
//  Created by Shin yongjun on 2022/06/14.
//

import SwiftUI

struct EndCredits: View {
    
    @State private var animationStart = false
    @State private var animationEnd = false
    // animation 지속시간
    private let middleAnimationDuration = 0.4
    private let startAnimationDuration = 5.0
    private let endAnimationDuration = 0.5
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Text("Hello Woody! \nHello Digi! \nHello Bethev! \nHello EllyJ! \nHello Rang! \nHello Sophie! \nHello Everett!\n\n\n\n Thank you")
                .fontWeight(.bold)
                .font(.system(size: 30, design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .truncationMode(.head)
                .lineSpacing(10)
                .padding()
            
            
                .rotation3DEffect(.degrees(animationEnd ? 0 : 45), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: 3, x: 0, y: 10)
                .frame(width: 500, height: animationStart ? 750 : 0)
                //.animation(Animation.linear(duration: startAnimationDuration), value: opacity)
//                .animation(Animation.linear(duration: animationEnd ? endAnimationDuration : startAnimationDuration))
                .animation(Animation.linear(duration: startAnimationDuration))
                .onAppear() {
                    self.animationStart.toggle()
                    opacity = 1
                    // animation 시간 후 animationEnd true
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.middleAnimationDuration) {
                            self.animationEnd.toggle()

                    }
            }
        }
        
    }
}

struct EndCredits_Previews: PreviewProvider {
    static var previews: some View {
        EndCredits()
    }
}

