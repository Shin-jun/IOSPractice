//
//  InBox.swift
//  LottiBoxOpen01
//
//  Created by Shin yongjun on 2022/06/10.
//

// https://stackoverflow.com/questions/66835559/swiftui-how-to-get-notified-when-dragging-and-releasing-on-an-view
//
import SwiftUI

struct InBox: View {
    //RatioSize.getResWidth(width: 40) or RatioSize.getResheight(height: 100)
    typealias OffsetType = (offset: CGSize, lastOffset: CGSize)
    
    @State private var objects: [OffsetType] = [
        (offset: CGSize(width: -20, height: 0.0),
         lastOffset: CGSize(width: -20, height: 0.0)),
                                                
        (offset: CGSize(width: 40, height: 0.0),
         lastOffset: CGSize(width: 40, height: 0.0)),
        
        (offset: CGSize(width: 0.0, height: -200),
         lastOffset: CGSize(width: 0.0, height: -200)),
        
        (offset: CGSize(width: 0.0, height: 200),
         lastOffset: CGSize(width: 0.0, height: 200))
        
    
            
    ]
    
    @State private var Photo = false
    
    var body: some View {
        
        ZStack {
            
            Image("InTheBox")
                .resizable()
                .foregroundColor(Color.brown)
                .frame(width: 400, height: 400)
            
            Image("BookFrame")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .offset(objects[2].offset)
                .gesture(dragGesture(indexOfObject: 2, false))
            
            Image("DocFrame")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .offset(objects[3].offset)
                .gesture(dragGesture(indexOfObject: 3, false))
            
            Image("Book")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .offset(objects[0].offset)
                .gesture(dragGesture(indexOfObject: 0, true))
            
            Image("Doc")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .offset(objects[1].offset)
                .gesture(dragGesture(indexOfObject: 1, true))
            
            
            if Photo == true {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        
                        .frame(width: 1000, height: 1000)
                        .padding()
                        .edgesIgnoringSafeArea(.all)
                    Image("Photo")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .padding()
                }
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0)))

            }
        }
        
    }
    
    func dragGesture(indexOfObject: Int, _ canMove: Bool) -> some Gesture {
        
        DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
            .onChanged() { value in
                
                var nextWidth: CGFloat = 0
                var nextHeight: CGFloat = 0
                if canMove {
                    nextWidth = value.translation.width
                    nextHeight = value.translation.height
                }
                
                objects[indexOfObject].offset =
                CGSize(
                    width: objects[indexOfObject].lastOffset.width + nextWidth,
                    height: objects[indexOfObject].lastOffset.height + nextHeight
                )
                
            }
            .onEnded() { value in
                
                var nextWidth: CGFloat = 0
                var nextHeight: CGFloat = 0
                if canMove {
                    nextWidth = value.translation.width
                    nextHeight = value.translation.height
                }
                
                objects[indexOfObject].lastOffset =
                CGSize(
                    width: objects[indexOfObject].lastOffset.width + nextWidth,
                    height: objects[indexOfObject].lastOffset.height + nextHeight
                )
                
                objects[indexOfObject].offset = objects[indexOfObject].lastOffset
                
                distance()
                
            }
        
    }
    
    func distance(){
        let firstJob = pow(pow((objects[0].offset.width - objects[2].offset.width), 2.0) + pow((objects[0].offset.height - objects[2].offset.height), 2.0), 0.5) <= 100
        let secondJob = pow(pow((objects[1].offset.width - objects[3].offset.width), 2.0) + pow((objects[1].offset.height - objects[3].offset.height), 2.0), 0.5) <= 100
        if  firstJob == true && secondJob == true {
            Photo = true
        } else {
            Photo = false
        }
        
    }
}

struct InBox_Previews: PreviewProvider {
    static var previews: some View {
        InBox()
    }
}
