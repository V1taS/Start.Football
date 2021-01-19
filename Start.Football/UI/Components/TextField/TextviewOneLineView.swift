//
//  TextviewOneLineView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import SwiftUI

struct TextviewOneLineView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var text: String
    let title: String
    let heightTextView: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                    .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 16))
                
                HStack {
                    TextView() {
                        $0.text = text
                        $0.font = UIFont(name: "Roboto-Regular", size: 18)
                        $0.textColor = .inactive
                        $0.autocapitalizationType = .sentences
                        $0.isSelectable = true
                        $0.isUserInteractionEnabled = true
                    }
                    .frame(height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: heightTextView))
                }
            }
            VStack(alignment: .leading, spacing: 0) {
                Color(.dividerColor)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 270),
                           height: height * Size.shared.getAdaptSizeHeight(px: 2))
            }
        }
    }
}

struct TextviewOneLineView_Previews: PreviewProvider {
    static var previews: some View {
        TextviewOneLineView(text: .constant(.init()), title: "Title",
                            heightTextView: 120)
    }
}

