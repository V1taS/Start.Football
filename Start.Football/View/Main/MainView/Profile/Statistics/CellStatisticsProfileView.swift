//
//  CellStatisticsProfileView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CellStatisticsProfileView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    let background: UIColor
    let textColor: UIColor
    let text: String
    let count: String
    
    var body: some View {
        ZStack {
            Color(background)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 164),
                       height: height * Size.shared.getAdaptSizeHeight(px: 138))
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 24)) {
                Text(text)
                    .foregroundColor(Color(textColor))
                    .font(Font.event.robotoMedium16)
                Text(count)
                    .foregroundColor(Color(textColor))
                    .font(Font.event.robotoLight48)
            }
            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 140), alignment: .leading)
        }
    }
}

struct CellStatisticsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CellStatisticsProfileView(background: .primaryColor,
                                  textColor: .whiteColor,
                                  text: "Участвовал",
                                  count: "53")
    }
}
