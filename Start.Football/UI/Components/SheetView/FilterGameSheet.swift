//
//  FilterGameSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct FilterGameSheet: View {
    
    var appBinding: Binding<AppState.AppData>
    @Environment(\.injected) private var injected: DIContainer
    let animation = Animation.interpolatingSpring(stiffness: 100,
                                                  damping: 30,
                                                  initialVelocity: 10)
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        appBinding.main.showFiltrsView.wrappedValue
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
            
            if appBinding.main.showFiltrsView.wrappedValue {
                VStack(spacing: 0) {
                    
                    divider
                    
                    VStack(alignment: .leading, spacing: 10) {
                        DatePickerView(currentDate: appBinding.main.selectedData)
                        TimePickerView(appBinding: appBinding)
                        CostView(appBinding: appBinding)
                        
                        availability
                        gameType
                        placeType
                    }
                    .padding(.top, 8)
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
        .frame(width: UIScreen.screenWidth - 40,
               height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 555))
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
        appBinding.main.showFiltrsView.wrappedValue = false
    }
    
    func expand() {
        appBinding.main.showFiltrsView.wrappedValue = false
    }
}

private extension FilterGameSheet {
    private var gameType: AnyView {
        AnyView(
            Group {
                Text("Тип игры")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                HStack {
                    Button(action: {
                        selectMiniFootball()
                    }) {
                        TextButtonRound(name: "Мини",
                                        isOn: appBinding.main.miniFootball.wrappedValue)
                    }
                    
                    Button(action: {
                        selectFootball()
                    }) {
                        TextButtonRound(name: "Стандарт",
                                        isOn: appBinding.main.football.wrappedValue)
                    }
                    
                    Button(action: {
                        selectFootsal()
                    }) {
                        TextButtonRound(name: "Футзал",
                                        isOn: appBinding.main.footsal.wrappedValue)
                    }
                }
            }
        )
    }
}

private extension FilterGameSheet {
    private var placeType: AnyView {
        AnyView(
            Group {
                Text("Где играть")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                
                HStack {
                    Button(action: {
                        selectStreet()
                    }) {
                        TextButtonRound(name: "Улица",
                                        isOn: appBinding.main.street.wrappedValue)
                    }
                    
                    Button(action: {
                        selectManege()
                    }) {
                        TextButtonRound(name: "Манеж",
                                        isOn: appBinding.main.manege.wrappedValue)
                    }
                    
                    Button(action: {
                        selectHall()
                    }) {
                        TextButtonRound(name: "Зал",
                                        isOn: appBinding.main.hall.wrappedValue)
                    }
                }
            }
        )
    }
}

private extension FilterGameSheet {
    private var divider: AnyView {
        AnyView(
            Color(.shotDividerColor)
                .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 48),
                       height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 5))
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(.shotDividerColor)))
                .offset(y: -15)
        )
    }
}

private extension FilterGameSheet {
    private var availability: AnyView {
        AnyView(
            Group {
                Text("Доступность")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                
                CheckboxFieldView(checked: appBinding.main.onlyFreeGame,
                                  text: "Только бесплатные игры")
                CheckboxFieldView(checked: appBinding.main.doNotShowGamesWithReserve,
                                  text: "Не показывать игры с резервом")
                CheckboxFieldView(checked: appBinding.main.availableToAll,
                                  text: "Для всех желающих")
            }
        )
    }
}

private extension FilterGameSheet {
    // MARK: Type Game
    private func selectMiniFootball() {
        injected.interactors.mainAppInteractor.selectMiniFootball(state: appBinding)
    }
    
    private func selectFootball() {
        injected.interactors.mainAppInteractor.selectFootball(state: appBinding)
    }
    
    private func selectFootsal() {
        injected.interactors.mainAppInteractor.selectFootsal(state: appBinding)
    }
}

private extension FilterGameSheet {
    // MARK: Place Play
    private func selectStreet() {
        injected.interactors.mainAppInteractor.selectStreet(state: appBinding)
    }
    
    private func selectManege() {
        injected.interactors.mainAppInteractor.selectManege(state: appBinding)
    }
    
    private func selectHall() {
        injected.interactors.mainAppInteractor.selectHall(state: appBinding)
    }
}



struct FilterGameSheet_Previews: PreviewProvider {
    static var previews: some View {
        FilterGameSheet(appBinding: .constant(.init()))
    }
}
