//
//  FlagImage.swift
//  guess-the-flag
//
//  Created by Jeremy's Macbook Pro 16 on 6/20/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    /// Used as identifier and image asset name
    let name: String
    
    let handler: () -> Void
    
    
    var body: some View {
        Button(action: handler) {
          Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 2))
            .shadow(color: .white, radius: 10)
        }
        
    }
    
}
