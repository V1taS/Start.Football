//
//  ProgressBarView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 28.12.2020.
//

import SwiftUI

struct ProgressBarView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var value: Float
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 160),
                       height: height * Size.shared.getAdaptSizeHeight(px: 5))
                .opacity(0.3)
                .foregroundColor(Color(.processCreateGameColor))
            
            Rectangle()
                .frame(width: min(CGFloat(self.value) * width * Size.shared.getAdaptSizeWidth(px: 160), width * Size.shared.getAdaptSizeWidth(px: 160)),
                       height: height * Size.shared.getAdaptSizeHeight(px: 5))
                .foregroundColor(Color(.primaryColor))
                .animation(.linear)
        }
        .cornerRadius(5)
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
    }
}
