//
//  ContentView.swift
//  AnimJPaubel
//
//  Created by Jared Paubel on 3/31/21.
//  Copyright © 2021 IN185 BS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount: CGFloat = 1
    @State private var animAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        HStack(spacing: 0) {
                   ForEach(0..<letters.count) { num in
                       Text(String(self.letters[num]))
                           .padding(5)
                           .font(.title)
                           .background(self.enabled ? Color.blue : Color.red)
                           .offset(self.dragAmount)
                           .animation(Animation.default.delay(Double(num) / 20))
                   }
        }
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//        .frame(width: 300, height: 200)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
    .offset(dragAmount)
        .gesture (
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                    // withAnimation(.spring()) { self.dragAmount = .zero }
                }
        )
    }
}
//-----SECTION 4-----------------------------------------------------------------------------
//Button(enabled ? "Bop It!" : "Bopped!") {
//    self.enabled.toggle()
//}
//.frame(width: 200, height: 200)
//.background(enabled ? Color.blue : Color.red)
//    // ternary operator if(condition) do this if true : do this if false
//.foregroundColor(.white)
//.animation(.easeIn)
//.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//    // ternary which if true round rectangle if false do nothing
// .animation(.interpolatingSpring(stiffness: 30, damping: 5))
//    // put what to animate above .animation
//-----SECTION 4-----------------------------------------------------------------------------

//-----SECTION 3-----------------------------------------------------------------------------
//Button("Bop it!") {
//    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//        self.animAmount += 360
//    }
//}
//.padding(50)
//.background(Color.blue)
//.foregroundColor(Color.white)
//.font(.title)
//.clipShape(Circle())
//.rotation3DEffect(
//    .degrees(animAmount),
//    axis: (x: 5, y: 5, z: 1))
//-----SECTION 3-----------------------------------------------------------------------------

//-----SECTION 2-----------------------------------------------------------------------------
//return VStack {
//   Stepper("Scale amount", value: $animationAmount.animation(
//    Animation.easeInOut(duration: 1)
//        .repeatCount(3, autoreverses: true)
//   ), in: 1...10)
//        // Stepper is a user interface control and allows
//            // user to increment or decrement a value by tapping
//   Spacer()
//
//   Button("Tap Me") {
//       self.animationAmount += 1
//   }
//   .padding(40)
//   .background(Color.green)
//   .foregroundColor(.white)
//   .clipShape(Circle())
//   .scaleEffect(animationAmount)
//Spacer()
//-----SECTION 2-----------------------------------------------------------------------------

//-----SECTION 1-----------------------------------------------------------------------------
//        Button("Tap Me") {
//            self.animationAmount += 1
//        }
//        .padding(25)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.gray)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                // WIll USE OPACITY MODIFIER ON HOMEWORK
//                .animation(
//                    Animation.easeInOut(duration: 2)
//                        .repeatForever(autoreverses: false)
//                )
//        )
//        .onAppear {
//            self.animationAmount = 2
//        }
////
////        .scaleEffect(animationAmount)
////        .blur(radius: (animationAmount - 1) * 3)
////        .animation(.easeIn(duration: 0.2))
////         To change time, use easeIn(duration:)
////
////        .animation(.interpolatingSpring(stiffness: 7, damping: 1))
//-----SECTION 1-----------------------------------------------------------------------------

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
