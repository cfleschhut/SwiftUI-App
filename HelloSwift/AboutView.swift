//
//  AboutView.swift
//  HelloSwift
//
//  Created by Christian Fleschhut on 30.06.20.
//  Copyright © 2020 Christian Fleschhut. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255/255, green: 214/255, blue: 179/255)

    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.vertical, 20)
        }
    }
    
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding([.horizontal, .bottom], 20)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Game instructions 🎯").modifier(AboutHeadingStyle())
                Text("Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet.").modifier(AboutBodyStyle())
                Text("Enjoy!").modifier(AboutBodyStyle())
            }
            .navigationBarTitle("About Bullseye")
            .background(beige)
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
