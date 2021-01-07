//
//  TypeOfParkingSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct TypeOfParkingSheet: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var isSheetActive: Bool
    let animation = Animation.interpolatingSpring(stiffness: 100,
                                                  damping: 30,
                                                  initialVelocity: 10)
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        isSheetActive
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
            
            if isSheetActive {
                VStack(spacing: 0) {
                    Color(.shotDividerColor)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                               height: height * Size.shared.getAdaptSizeHeight(px: 5))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(.shotDividerColor)))
                        .offset(y: -15)
                    
                    HStack {
                        Text("Тип парковки")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        Spacer()
                    }
                    
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
                    
                    VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                        
                        HStack {
                            Text("Платная городская")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular18)
                            Spacer()
                            ButtonRoundGreen(status: false)
                        }
                        Divider()
                        
                        HStack {
                            Text("Платная на территории")
                                .foregroundColor(.primaryColor)
                                .font(Font.event.robotoRegular18)
                            Spacer()
                            ButtonRoundGreen(status: true)
                        }
                        Divider()
                        
                        HStack {
                            Text("Бесплатная на территории")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular18)
                            Spacer()
                            ButtonRoundGreen(status: false)
                        }
                        Divider()
                        
                        HStack {
                            Text("Бесплатная городская")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular18)
                            Spacer()
                            ButtonRoundGreen(status: true)
                        }
                        Divider()
                        
                        TextfieldOneLineView(text: .constant(""),
                                             title: "Стоимость",
                                             icon: "",
                                             iconShow: false,
                                             placeholder: "Укажите стоимость",
                                             keyboardType: .numberPad)
                        
                        HStack {
                            HStack {
                                ButtonRoundGreen(status: true)
                                Text("Разово")
                                    .foregroundColor(.primaryColor)
                                    .font(Font.event.robotoRegular16)
                            }
                            Spacer()
                            HStack {
                                ButtonRoundGreen(status: false)
                                Text("За час")
                                    .foregroundColor(.defaultColor)
                                    .font(Font.event.robotoRegular16)
                            }
                            Spacer()
                            Spacer()
                        }
                    }
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 25))
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
        .frame(width: width, height: height * Size.shared.getAdaptSizeHeight(px: 500))
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
        self.isSheetActive = false
    }
    
    func expand() {
        self.isSheetActive = false
    }
}

struct TypeOfParkingSheet_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfParkingSheet(isSheetActive: .constant(true))
    }
}
