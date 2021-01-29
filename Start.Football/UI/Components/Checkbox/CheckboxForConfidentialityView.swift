//
//  CheckboxForConfidentialityView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 28.01.2021.
//

import SwiftUI

struct CheckboxForConfidentialityView : View {
    
    @Binding var checked: Bool
    
    var body: some View {
        HStack {
            HStack(alignment: .firstTextBaseline, spacing: 10) {
                heckbox
                boxTextAndButtonView
            }
            .frame(width: 299,
                   alignment: .leading)
            Spacer()
        }
    }
}

// MARK: UI
private extension CheckboxForConfidentialityView {
    private var heckbox: AnyView {
        AnyView(
            Image(systemName: checked ? "checkmark.square" : "square")
                .foregroundColor(checked ? .primaryColor : .defaultColor)
                .frame(width: 18,
                       height: 18)
                .onTapGesture {
                    self.checked.toggle()
                }
        )
    }
}

private extension CheckboxForConfidentialityView {
    private var boxTextAndButtonView: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 0) {
                textView
                buttonConfidentiality
            }
        )
    }
}

private extension CheckboxForConfidentialityView {
    private var textView: AnyView {
        AnyView(
            Text("Создавая аккаунт вы принимаете")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoRegular16)
        )
    }
}

private extension CheckboxForConfidentialityView {
    private var buttonConfidentiality: AnyView {
        AnyView(
            Button(action: {
                showConfidentialityPage()
            }) {
                Text("правила сервиса и политику конфиденциальности")
                    .foregroundColor(.primaryColor)
                    .font(Font.event.robotoRegular16)
            }
        )
    }
}

// MARK: Actions
private extension CheckboxForConfidentialityView {
    private func showConfidentialityPage() {
        
    }
}

struct CheckboxForConfidentialityView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxForConfidentialityView(checked: .constant(false))
    }
}
