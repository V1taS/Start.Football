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
        Button(action: {
            showParkingToggle()
        } ) {
            VStack(alignment: .leading, spacing: 0) {
                header
                configureStringCostParking
                Divider()
                    .padding(.top, 8)
            }
        }
    }
}


// MARK: UI
private extension ButtonParking {
    private var header: AnyView {
        AnyView(
            Text("Парковка")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
        )
    }
}

private extension ButtonParking {
    private var configureStringCostParking: AnyView {
        AnyView(
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
            .padding(.top, 16)
        )
    }
}


// MARK: Actions
private extension ButtonParking {
    private func showParkingToggle() {
        appBinding.createGame.showParking.wrappedValue.toggle()
    }
}

struct ButtonParking_Previews: PreviewProvider {
    static var previews: some View {
        ButtonParking(appBinding: .constant(.init()))
    }
}
