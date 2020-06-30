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
    @State var score = 0
    @State var round = 1
    
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
                Text("Hit me!")
            }
            .alert(isPresented: $alertIsVisible) {
                Alert(
                    title: Text(alertTitle()),
                    message: Text(
                        "Slider value: \(sliderValueRounded())\n\n" +
                        "You scored \(pointsForCurrentRound()) points this round."
                    ),
                    dismissButton: .default(Text("Awesome!")) {
                        self.score += self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    }
                )
            }
            
            //
            Spacer()
            HStack {
                Button(action: {}) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        
        switch difference {
        case 0:
            bonus = 100
        case 1:
            bonus = 50
        default:
            bonus = 0
        }
        
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        
        switch difference {
        case 0:
            title = "Perfect!"
        case 1..<5:
            title = "You almost had it!"
        case 5..<10:
            title = "Not bad."
        default:
            title = "Are you even trying?"
        }
        
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
