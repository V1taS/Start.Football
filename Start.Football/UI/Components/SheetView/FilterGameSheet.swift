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
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        appBinding.main.filter.showFiltrsView.wrappedValue
    }
    
    var body: some View {
        ZStack {
            
            if appBinding.main.filter.showFiltrsView.wrappedValue {
                VStack(spacing: 0) {
                    divider
                    
                    VStack(alignment: .leading, spacing: 10) {
                        DatePickerView(currentDate: appBinding.main.filter.selectedData)
                        TimePickerView(appBinding: appBinding)
                        CostView(appBinding: appBinding)
                        
                        availability
                        gameType
                        placeType
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
private extension FilterGameSheet {
    private var closeButton: AnyView {
        AnyView(
            VStack(spacing: 0) {
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
        )
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
                                        isOn: appBinding.main.filter
                                            .miniFootball.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectFootball()
                    }) {
                        TextButtonRound(name: "Стандарт",
                                        isOn: appBinding.main.filter
                                            .football.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectFootsal()
                    }) {
                        TextButtonRound(name: "Футзал",
                                        isOn: appBinding.main
                                            .filter.footsal.wrappedValue,
                                        backgroundColor: .primaryColor)
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
                                        isOn: appBinding.main.filter
                                            .street.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectManege()
                    }) {
                        TextButtonRound(name: "Манеж",
                                        isOn: appBinding.main.filter
                                            .manege.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectHall()
                    }) {
                        TextButtonRound(name: "Зал",
                                        isOn: appBinding.main.filter
                                            .hall.wrappedValue,
                                        backgroundColor: .primaryColor)
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
                .frame(width: 48, height: 5)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(.shotDividerColor)))
                .offset(y: 10)
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
                
                CheckboxFieldView(checked: appBinding.main.filter.onlyFreeGame,
                                  text: "Только бесплатные игры")
                CheckboxFieldView(checked: appBinding.main.filter.doNotShowGamesWithReserve,
                                  text: "Не показывать игры с резервом")
                CheckboxFieldView(checked: appBinding.main.filter.availableToAll,
                                  text: "Для всех желающих")
            }
        )
    }
}


// MARK: Actions
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



struct FilterGameSheet_Previews: PreviewProvider {
    static var previews: some View {
        FilterGameSheet(appBinding: .constant(.init()))
    }
}
