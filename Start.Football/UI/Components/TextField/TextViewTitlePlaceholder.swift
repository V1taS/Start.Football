//
//  TextviewOneLineView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import SwiftUI

struct TextViewTitlePlaceholder: View {
    
    @Binding var text: String
    let placeholder: String
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                header
                textView
            }
            divider
        }
    }
}


// MARK: UI
private extension TextViewTitlePlaceholder {
    private var header: AnyView {
        AnyView(
            Text(title)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, 8)
        )
    }
}

private extension TextViewTitlePlaceholder {
    private var textView: AnyView {
        AnyView(
            HStack {
                TextView(placeholder: placeholder,
                         text: $text)
                    .frame(minHeight: 90, maxHeight: 120)
            }
        )
    }
}

private extension TextViewTitlePlaceholder {
    private var divider: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Color(.dividerColor)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
            }
            .padding(.top, 4)
        )
    }
}

struct TextviewOneLineView_Previews: PreviewProvider {
    static var previews: some View {
        TextViewTitlePlaceholder(text: .constant("sdvsdvsdv"),
                                 placeholder: "sdv", title: "sv")
    }
}

