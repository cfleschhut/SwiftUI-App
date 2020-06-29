//
//  ContentView.swift
//  HelloSwift
//
//  Created by Christian Fleschhut on 26.06.20.
//  Copyright © 2020 Christian Fleschhut. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            //
            Spacer()
            HStack {
                Text("Put the slider as close as you can to:")
                Text("\(target)")
            }
            
            //
            Spacer()
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            
            //
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) {
                let roundedValue = Int(sliderValue.rounded())
                return Alert(
                    title: Text("Hello there!"),
                    message: Text(
                        "Slider value: \(roundedValue)\n\n" +
                        "You scored \(pointsForCurrentRound()) points this round."
                    ),
                    dismissButton: .default(Text("Awesome!"))
                )
            }
            
            //
            Spacer()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
    }
    
    func pointsForCurrentRound() -> Int {
        let roundedValue = Int(sliderValue.rounded())
        let difference = abs(target - roundedValue)
        let awardedPoints = 100 - difference
        
        return awardedPoints
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
