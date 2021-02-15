//
//  TypeOfParkingSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct TypeOfParkingSheet: View {
    
    var appBinding: Binding<AppState.AppData>
    @Environment(\.injected) private var injected: DIContainer
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        appBinding.createGame.showParking.wrappedValue
    }
    
    var body: some View {
        ZStack{
            
            if appBinding.createGame.showParking.wrappedValue {
                ZStack {
                    VStack(spacing: 0) {
                        divider
                        headerView
                        
                        VStack(spacing: 24) {
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
                            Color.clear
                                .frame(height: 50)
                        }
                        .padding(.top, 25)
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
}


// MARK: UI
private extension TypeOfParkingSheet {
    private var closeButton: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if isExpanded {
                    VStack {
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
                    }
                }
            }
        )
    }
}

private extension TypeOfParkingSheet {
    private var divider: AnyView {
        AnyView(
            Color(.shotDividerColor)
                .frame(width: 48, height: 5)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(.shotDividerColor)))
                .offset(y: -15)
        )
    }
}

private extension TypeOfParkingSheet {
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


private extension TypeOfParkingSheet {
    var paidCity: some View {
        Button(action: {
            selectPaidCity()
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

private extension TypeOfParkingSheet {
    var paidOnTheTerritory: some View {
        Button(action: {
            selectPaidOnTheTerritory()
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

private extension TypeOfParkingSheet {
    var freeOnTheTerritory: some View {
        Button(action: {
            selectFreeOnTheTerritory()
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

private extension TypeOfParkingSheet {
    var freeCity: some View {
        Button(action: {
            selectFreeCity()
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

private extension TypeOfParkingSheet {
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

private extension TypeOfParkingSheet {
    var oneTime: some View {
        Button(action: {
            selectOneTime()
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
            selectInAnHour()
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
            selectNon()
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


// MARK: Actions
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
    
    private func onDragEnded(drag: DragGesture.Value) {
        self.viewState = .zero
        let direction = drag.predictedEndLocation.y - drag.location.y
        
        if direction > 0 {
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
        appBinding.createGame.showParking.wrappedValue = false
    }
    
    private func expand() {
    }
}

struct TypeOfParkingSheet_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfParkingSheet(appBinding: .constant(.init()))
    }
}
