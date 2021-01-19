//
//  TypeOfParkingSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct TypeOfParkingSheet: View {
    
    var appBinding: Binding<AppState.AppData.CreateGame>
    @Environment(\.injected) private var injected: DIContainer
    
    let animation = Animation.interpolatingSpring(stiffness: 100,
                                                  damping: 30,
                                                  initialVelocity: 10)
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        appBinding.showParking.wrappedValue
    }
    
    var body: some View {
        ZStack{
            if isExpanded {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: { self.collapse()}) {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(.secondaryLabel))
                        }
                    }
                    Spacer()
                }
            }
            
            if appBinding.showParking.wrappedValue {
                VStack(spacing: 0) {
                    Color(.shotDividerColor)
                        .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 48),
                               height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 5))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(.shotDividerColor)))
                        .offset(y: -15)
                    
                    HStack {
                        Text("Тип парковки")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        Spacer()
                    }
                    
                    .padding(.top, 8)
                    
                    VStack(spacing: 16) {
                        Group {
                            paidCity
                            Divider()
                            paidOnTheTerritory
                            Divider()
                            freeOnTheTerritory
                            Divider()
                            freeCity
                            Divider()
                            parkingCost
                        }
                        HStack {
                            oneTime
                            Spacer()
                            inAnHour
                            Spacer()
                            non
                            Spacer()
                            Spacer()
                        }
                    }
                    .padding(.top, 25)
                    Spacer()
                }
            }
        }
        .padding(.all, 24)
        .background(Color(.backgroundColor))
        .cornerRadius(25)
        .shadow(color: Color(.black)
                    .opacity(self.viewState.height == 0 ? 0.2 : 0),
                radius: 5)
        .offset(y: offset())
        .zIndex(isExpanded ? 1 : 0)
        .gesture(
            DragGesture().onChanged { value in
                self.viewState = value.translation
            }
            .onEnded(onDragEnded)
        )
        .animation(animation)
        .frame(width: UIScreen.screenWidth-40, height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 500))
    }
    
    func onDragEnded(drag: DragGesture.Value) {
        self.viewState = .zero
        let direction = drag.predictedEndLocation.y - drag.location.y
        
        if direction > 0 {
            self.collapse()
        } else {
            self.expand()
        }
    }
    
    func offset()  -> CGFloat {
        var offset: CGFloat = 0
        if self.isExpanded {
            offset = 0 + self.viewState.height
        } else {
            offset = 500 + self.viewState.height
        }
        
        return offset < 0 ? 0 : offset > 500 ? 500 : offset
    }
    
    func collapse() {
        appBinding.showParking.wrappedValue = false
    }
    
    func expand() {
        appBinding.showParking.wrappedValue = false
    }
}

// MARK: - Paid City
private extension TypeOfParkingSheet {
    var paidCity: some View {
        Button(action: {
            selectPaidCity()
        }) {
            HStack {
                Text("Платная городская")
                    .foregroundColor(appBinding.typeOfParking.wrappedValue == AppActions.CreateGame
                                        .TypeOfParking.paidCity ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.typeOfParking
                                    .wrappedValue == AppActions.CreateGame
                                    .TypeOfParking.paidCity)
            }
        }
    }
}

// MARK: - Paid on the territory
private extension TypeOfParkingSheet {
    var paidOnTheTerritory: some View {
        Button(action: {
            selectPaidOnTheTerritory()
        }) {
            HStack {
                Text("Платная на территории")
                    .foregroundColor(appBinding.typeOfParking.wrappedValue == AppActions.CreateGame
                                        .TypeOfParking.paidOnTheTerritory ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.typeOfParking
                                    .wrappedValue == AppActions.CreateGame
                                    .TypeOfParking.paidOnTheTerritory)
            }
        }
    }
}

// MARK: - Free on the territory
private extension TypeOfParkingSheet {
    var freeOnTheTerritory: some View {
        Button(action: {
            selectFreeOnTheTerritory()
        }) {
            HStack {
                Text("Бесплатная на территории")
                    .foregroundColor(appBinding.typeOfParking.wrappedValue == AppActions.CreateGame
                                        .TypeOfParking.freeOnTheTerritory ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.typeOfParking
                                    .wrappedValue == AppActions.CreateGame
                                    .TypeOfParking.freeOnTheTerritory)
            }
        }
    }
}

// MARK: - Free City
private extension TypeOfParkingSheet {
    var freeCity: some View {
        Button(action: {
            selectFreeCity()
        }) {
            HStack {
                Text("Бесплатная городская")
                    .foregroundColor(appBinding.typeOfParking.wrappedValue == AppActions.CreateGame
                                        .TypeOfParking.freeCity ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular18)
                Spacer()
                ButtonRoundGreen(status: appBinding.typeOfParking
                                    .wrappedValue == AppActions.CreateGame
                                    .TypeOfParking.freeCity)
            }
        }
    }
}

// MARK: - Parking cost
private extension TypeOfParkingSheet {
    var parkingCost: some View {
        TextfieldOneLineView(text: appBinding.parkingCost,
                             title: "Стоимость",
                             icon: "",
                             iconShow: false,
                             placeholder: "Укажите стоимость",
                             keyboardType: .numberPad)
    }
}

// MARK: - Payment for parking
private extension TypeOfParkingSheet {
    var oneTime: some View {
        Button(action: {
            selectOneTime()
        }) {
            HStack {
                ButtonRoundGreen(status: appBinding.paymentForParking
                                    .wrappedValue == AppActions.CreateGame
                                    .PaymentForParking.oneTime)
                Text("Разово")
                    .foregroundColor(appBinding.paymentForParking.wrappedValue == AppActions.CreateGame
                                        .PaymentForParking.oneTime ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        }
    }
    
    var inAnHour: some View {
        Button(action: {
            selectInAnHour()
        }) {
            HStack {
                ButtonRoundGreen(status: appBinding.paymentForParking
                                    .wrappedValue == AppActions.CreateGame
                                    .PaymentForParking.inAnHour)
                Text("За час")
                    .foregroundColor(appBinding.paymentForParking.wrappedValue == AppActions.CreateGame
                                        .PaymentForParking.inAnHour ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        }
    }
    
    var non: some View {
        Button(action: {
            selectNon()
        }) {
            HStack {
                ButtonRoundGreen(status: appBinding.paymentForParking
                                    .wrappedValue == AppActions.CreateGame
                                    .PaymentForParking.non)
                Text("Нет")
                    .foregroundColor(appBinding.paymentForParking.wrappedValue == AppActions.CreateGame
                                        .PaymentForParking.non ? .primaryColor : .secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        }
    }
}

private extension TypeOfParkingSheet {
    // MARK: Type of parking
    private func selectPaidCity() {
        injected.interactors.createGameInteractor.paidCity(state: appBinding)
    }
    
    private func selectPaidOnTheTerritory() {
        injected.interactors.createGameInteractor.paidOnTheTerritory(state: appBinding)
    }
    
    private func selectFreeOnTheTerritory() {
        injected.interactors.createGameInteractor.freeOnTheTerritory(state: appBinding)
    }
    
    private func selectFreeCity() {
        injected.interactors.createGameInteractor.freeCity(state: appBinding)
    }
}

private extension TypeOfParkingSheet {
    // MARK: - Payment for parking
    private func selectOneTime() {
        injected.interactors.createGameInteractor.oneTime(state: appBinding)
    }
    
    private func selectInAnHour() {
        injected.interactors.createGameInteractor.inAnHour(state: appBinding)
    }
    
    private func selectNon() {
        injected.interactors.createGameInteractor.non(state: appBinding)
    }
}

struct TypeOfParkingSheet_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfParkingSheet(appBinding: .constant(.init()))
    }
}
