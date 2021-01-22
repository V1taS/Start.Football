//
//  ImageViewMiniCG.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import SwiftUI

struct ImageViewMiniCG: View {
    
    let image: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(Color(.whiteColor))
                            .offset(x: -10, y: 10.0)
                    }
                }
                Spacer()
            }
        }
        .cornerRadius(25)
        .frame(width: 155, height: 155)
    }
}

struct ImageViewMiniCG_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewMiniCG(image: "CGfield_1")
    }
}
