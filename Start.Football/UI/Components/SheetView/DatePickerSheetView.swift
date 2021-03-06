//
//  DatePickerSheetView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 30.01.2021.
//

import SwiftUI

struct DatePickerSheetView: View {
    
    var appBinding: Binding<AppState.AppData>
    @Environment(\.injected) private var injected: DIContainer
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        appBinding.createGame.showDatePicker.wrappedValue
    }
    
    var body: some View {
        ZStack {
            
            if appBinding.createGame.showDatePicker.wrappedValue {
                VStack(spacing: 0) {
                    divider
                    
                    VStack(alignment: .leading, spacing: 10) {
                        DatePickerView(currentDate: appBinding.createGame.currentDate)
                            .transition(.move(edge: .bottom))
                            .animation(.easeOut(duration: 0.7))
                        TimePickerCreateGame(currentDate: appBinding.createGame.currentDate)
                            .accentColor(.secondaryColor)
                        
                        Button(action: {
                            appBinding.createGame.showDatePicker.wrappedValue = false
                            appBinding.createGame.currentDateHasBeenChanged.wrappedValue = true
                        }) {
                            ButtonView(background: .primaryColor,
                                       textColor: .whiteColor,
                                       borderColor: .primaryColor,
                                       text: "Применить",
                                       switchImage: false,
                                       image: "")
                        }
                        
                    }
                    .padding(24)
                    .padding(.top, 8)
                }
                .background(Color.backgroundColor)
                .cornerRadius(25)
                .shadow(color: Color(.black)
                            .opacity(self.viewState.height == 0 ? 0.2 : 0),
                        radius: 5)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.7))
            }
        }
        .offset(y: offset())
        .gesture(
            DragGesture().onChanged { value in
                self.viewState = value.translation
            }
            .onEnded(onDragEnded)
        )
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        self.viewState = .zero
        let direction = drag.predictedEndLocation.y - drag.location.y
        
        if direction > 200 {
            self.collapse()
        } else {
            self.expand()
        }
    }
    
    private func offset()  -> CGFloat {
        var offset: CGFloat = 0
        if self.isExpanded {
            offset = 0 + self.viewState.height
        } else {
            offset = 500 + self.viewState.height
        }
        
        return offset < 0 ? 0 : offset > 500 ? 500 : offset
    }
    
    private func collapse() {
        appBinding.main.filter.showFiltrsView.wrappedValue = false
    }
    
    private func expand() {
        
    }
}


private extension DatePickerSheetView {
    private var divider: AnyView {
        AnyView(
            Color(.shotDividerColor)
                .frame(width: 48, height: 5)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(.shotDividerColor)))
                .offset(y: 10)
        )
    }
}

private extension DatePickerSheetView {
    private var headerView: AnyView {
        AnyView(
            HStack {
                Text("Тип парковки")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium32)
                Spacer()
            }
            .padding(.top, 8)
        )
    }
}


private extension DatePickerSheetView {
    var paidCity: some View {
        Button(action: {

        }) {
            HStack {
                Text("Платная городская")
                    .foregroundColor(appBinding.createGame.typeOfParking.wrappedValue == AppActions.CreatGameActions
                                        .TypeOfParking.paidCity ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.createGame.typeOfParking
                                    .wrappedValue == AppActions.CreatGameActions
                                    .TypeOfParking.paidCity)
            }
        }
    }
}

private extension DatePickerSheetView {
    var paidOnTheTerritory: some View {
        Button(action: {

        }) {
            HStack {
                Text("Платная на территории")
                    .foregroundColor(appBinding.createGame.typeOfParking.wrappedValue == AppActions.CreatGameActions
                                        .TypeOfParking.paidOnTheTerritory ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.createGame.typeOfParking
                                    .wrappedValue == AppActions.CreatGameActions
                                    .TypeOfParking.paidOnTheTerritory)
            }
        }
    }
}

private extension DatePickerSheetView {
    var freeOnTheTerritory: some View {
        Button(action: {
 
        }) {
            HStack {
                Text("Бесплатная на территории")
                    .foregroundColor(appBinding.createGame.typeOfParking.wrappedValue == AppActions.CreatGameActions
                                        .TypeOfParking.freeOnTheTerritory ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.createGame.typeOfParking
                                    .wrappedValue == AppActions.CreatGameActions
                                    .TypeOfParking.freeOnTheTerritory)
            }
        }
    }
}

private extension DatePickerSheetView {
    var freeCity: some View {
        Button(action: {
         
        }) {
            HStack {
                Text("Бесплатная городская")
                    .foregroundColor(appBinding.createGame.typeOfParking.wrappedValue == AppActions.CreatGameActions
                                        .TypeOfParking.freeCity ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.createGame.typeOfParking
                                    .wrappedValue == AppActions.CreatGameActions
                                    .TypeOfParking.freeCity)
            }
        }
    }
}

private extension DatePickerSheetView {
    var parkingCost: some View {
        TextfieldOneLineView(text: appBinding.createGame.parkingCost,
                             title: "Стоимость",
                             icon: "",
                             iconShow: false,
                             placeholder: "Укажите стоимость",
                             keyboardType: .numberPad,
                             success: appBinding.createGame.parkingCostSuccess.wrappedValue,
                             textAlignment: .left,
                             limitLength: 4)
    }
}

private extension DatePickerSheetView {
    var oneTime: some View {
        Button(action: {
          
        }) {
            HStack {
                ButtonRoundGreen(status: appBinding.createGame.paymentForParking
                                    .wrappedValue == AppActions.CreatGameActions
                                    .PaymentForParking.oneTime)
                    .frame(width: 30)
                Text("Разово")
                    .foregroundColor(appBinding.createGame.paymentForParking.wrappedValue == AppActions.CreatGameActions
                                        .PaymentForParking.oneTime ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        }
    }
    
    var inAnHour: some View {
        Button(action: {

        }) {
            HStack {
                ButtonRoundGreen(status: appBinding.createGame.paymentForParking
                                    .wrappedValue == AppActions.CreatGameActions
                                    .PaymentForParking.inAnHour)
                    .frame(width: 30)
                Text("За час")
                    .foregroundColor(appBinding.createGame.paymentForParking.wrappedValue == AppActions.CreatGameActions
                                        .PaymentForParking.inAnHour ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        }
    }
    
    var non: some View {
        Button(action: {
       
        }) {
            HStack {
                ButtonRoundGreen(status: appBinding.createGame.paymentForParking
                                    .wrappedValue == AppActions.CreatGameActions
                                    .PaymentForParking.non)
                    .frame(width: 30)
                Text("Нет")
                    .foregroundColor(appBinding.createGame.paymentForParking.wrappedValue == AppActions.CreatGameActions
                                        .PaymentForParking.non ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        }
    }
}

struct DatePickerSheetView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerSheetView(appBinding: .constant(.init()))
    }
}
