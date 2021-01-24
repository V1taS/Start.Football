//
//  ButtonParking.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct ButtonParking: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth

    var appBinding: Binding<AppState.AppData>
    
    var body: some View {
        Button(action: { appBinding.createGame.showParking.wrappedValue.toggle() } ) {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 0)) {
                
                Text("Парковка")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Text("\(appBinding.createGame.typeOfParking.wrappedValue.rawValue)")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular18)
                    
                    Text(appBinding.createGame.paymentForParking.wrappedValue == .non ? "" : "\(appBinding.createGame.parkingCost.wrappedValue)")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular18)
                    
                    Text(appBinding.createGame.paymentForParking.wrappedValue == .non ? "" : "₽")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular18)
                    
                    Text(appBinding.createGame.paymentForParking.wrappedValue == .non ? "" : "\(appBinding.createGame.paymentForParking.wrappedValue.rawValue)")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular18)
                    
                    Spacer()
                    Image("right")
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                
                Divider()
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
            }
        }
    }
}

struct ButtonParking_Previews: PreviewProvider {
    static var previews: some View {
        ButtonParking(appBinding: .constant(.init()))
    }
}
