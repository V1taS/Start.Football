//
//  AboutTheAreaCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct AboutTheAreaCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("О ПЛОЩАДКЕ")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                Text("Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну.")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct AboutTheAreaCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        AboutTheAreaCurrentGame()
    }
}
