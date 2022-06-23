//
//  ContentView.swift
//  BackgroundMusic
//
//  Created by Shin yongjun on 2022/06/15.
//

import SwiftUI
import AVKit
struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!

    var body: some View {
        ZStack {
                   VStack {
                           Text("Play").font(.system(size: 45)).font(.largeTitle)
                       HStack {
                           Spacer()
                           Button(action: {
                               self.audioPlayer.play()
                           }) {
                               Image(systemName: "play.circle.fill").resizable()
                                   .frame(width: 50, height: 50)
                                   .aspectRatio(contentMode: .fit)
                           }
                           Spacer()
                           Button(action: {
                               self.audioPlayer.pause()
                           }) {
                               Image(systemName: "pause.circle.fill").resizable()
                                   .frame(width: 50, height: 50)
                                   .aspectRatio(contentMode: .fit)
                           }
                           Spacer()
                       }
                   }
               }
               .onAppear {
                   let sound = Bundle.main.path(forResource: "MyVeryOwnDeadShip", ofType: "mp3")
                   self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
