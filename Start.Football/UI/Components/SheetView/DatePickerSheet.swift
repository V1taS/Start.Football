//
//  DatePickerSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct DatePickerSheet: View {
    
    var appBinding: Binding<AppState.AppData.CreateGame>
    @Environment(\.injected) private var injected: DIContainer

    let animation = Animation.interpolatingSpring(stiffness: 100,
                                                  damping: 30,
                                                  initialVelocity: 10)
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        appBinding.showDatePicker.wrappedValue
    }
    
    var body: some View {
        ZStack {
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
            
            if appBinding.showDatePicker.wrappedValue{
                VStack(spacing: 0) {
                    Color(.shotDividerColor)
                        .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 48),
                               height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 5))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(.shotDividerColor)))
                        .offset(y: -15)
                    
                    
                    VStack(alignment: .leading) {
                        DatePickerView(currentDate: appBinding.currentDate)
                        Button(action: {
                            injected.interactors.createGameInteractor.showDayInTextfield(state: appBinding)
                            self.collapse()
                        }) {
                            ButtonView(background: .primaryColor,
                                       textColor: .whiteColor,
                                       borderColor: .primaryColor,
                                       text: "Применить",
                                       switchImage: false,
                                       image: "")
                                .scaleEffect(0.9)
                        }
                    }
                    .padding(.top, 16)
                    

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
        .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 200))
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
        self.appBinding.showDatePicker.wrappedValue = false
    }
    
    func expand() {
        self.appBinding.showDatePicker.wrappedValue = false
    }
}

struct DatePickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerSheet(appBinding: .constant(.init()))
    }
}
