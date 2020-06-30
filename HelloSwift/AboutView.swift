//
//  AboutView.swift
//  HelloSwift
//
//  Created by Christian Fleschhut on 30.06.20.
//  Copyright © 2020 Christian Fleschhut. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("🎯 Game instructions 🎯")
            Text("Lorem Ipsum dolor sit amet")
            Text("Enjoy!")
        }
        .navigationBarTitle("About Bullseye")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
