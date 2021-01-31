//
//  CostView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 07.12.2020.
//

import SwiftUI

struct CostView: View {
    
    var appBinding: Binding<AppState.AppData>
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                header
                
                HStack {
                    iconView
                    firstTextField
                    shotDivider
                    secondTextField
                    Spacer()
                }
                .padding(.bottom, 11)
            }
            divider
        }
    }
}


// MARK: UI
private extension CostView {
    private var header: AnyView {
        AnyView(
            Text("Стоимость")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, 16)
        )
    }
}

private extension CostView {
    private var iconView: AnyView {
        AnyView(
            Image("datePicerRubls")
        )
    }
}

private extension CostView {
    private var firstTextField: AnyView {
        AnyView(
            HStack(spacing: 0) {
                TextFieldUIKit(placeholder: "500",
                               text: appBinding.main.filter.costSince,
                               font: UIFont.event.robotoRegular24!,
                               foregroundColor: .secondaryColor,
                               keyType: .numberPad,
                               isSecureText: false)
                    .frame(width: 55, height: 30)
                
                Text("₽")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                    .frame(width: 20)
            }
        )
    }
}

private extension CostView {
    private var shotDivider: AnyView {
        AnyView(
            Text("—")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoRegular24)
        )
    }
}

private extension CostView {
    private var secondTextField: AnyView {
        AnyView(
            HStack {
                TextFieldUIKit(placeholder: "1000",
                               text: appBinding.main.filter.costUntil,
                               font: UIFont.event.robotoRegular24!,
                               foregroundColor: .secondaryColor,
                               keyType: .numberPad,
                               isSecureText: false)
                    .frame(width: 55, height: 30)
                
                Text("₽")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                    .frame(width: 20)
            }
        )
    }
}

private extension CostView {
    private var divider: AnyView {
        AnyView(
            VStack(alignment: .center, spacing: 0) {
                Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
            }
        )
    }
}

struct CostView_Previews: PreviewProvider {
    static var previews: some View {
        CostView(appBinding: .constant(.init()))
    }
}
