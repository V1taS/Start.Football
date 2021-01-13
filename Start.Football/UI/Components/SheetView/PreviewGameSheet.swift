//
//  BottomSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct PreviewGameSheet: View {
    
    @Binding var isSheetActive: Bool
    let animation = Animation.interpolatingSpring(stiffness: 100,
                                                  damping: 30,
                                                  initialVelocity: 10)
    
    @State var viewState = CGSize.zero
    var isExpanded: Bool {
        isSheetActive
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth

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
                        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 18))
                    
                    HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 16)) {
                        Text("Зал")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.secondaryColor))
                        
                        Text("Манеж")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.secondaryColor))
                        
                        Text("Улица")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.secondaryColor))
                        Spacer()
                    }
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                    
                    VStack(alignment: .leading,
                           spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                        
                        Text("Тренировка в ФОК Отрадное")
                            .font(Font.event.robotoBold20)
                            .foregroundColor(.secondaryColor)
                        HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                            Image("cellDate")
                            Text("30 августа, 16:00-18:00")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular16)
                        }
                        HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                            Image("cellLocator")
                            Text("ул. Хачтуряна, 12, стр. 2")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular16)
                            Spacer()
                            Text("5,2 км")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular16)
                        }
                        HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 10)) {
                            Image("cellMoney")
                            Text("500 ₽")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular24)
                            Spacer()
                            HStack(alignment: .center, spacing: -20) {
                                Image("p5")
                                    .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                                Image("p4")
                                    .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                                Image("p3")
                                    .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                                Image("p2")
                                    .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                                Image("p1")
                                    .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                            }
                        }
                    }
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                    
                    Button(action: {}) {
                        ButtonView(background: .primaryColor,
                                   textColor: .whiteColor,
                                   borderColor: .primaryColor,
                                   text: "Подробнее об игре")
                    }
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
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
        .frame(width: width - width * Size.shared.getAdaptSizeWidth(px: 20),
               height: height * Size.shared.getAdaptSizeHeight(px: 340))
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
        //        editorController.isActive = false
        self.isSheetActive = false
    }
    
    func expand() {
        //        editorController.isActive = true
        self.isSheetActive = false
    }
}


struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        PreviewGameSheet(isSheetActive: .constant(true))
    }
}
