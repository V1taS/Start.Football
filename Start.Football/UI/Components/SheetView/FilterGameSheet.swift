//
//  FilterGameSheet.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI

struct FilterGameSheet: View {
    
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
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Group {
                            DatePickerView(currentDate: .constant(Date(timeIntervalSince1970: TimeInterval(12))))
                            TimePickerView()
                            CostView()
                        }
                        
                        Group {
                            Text("Доступность")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoMedium18)
                            CheckboxFieldView(checked: .constant(false),
                                              text: "Только бесплатные игры")
                            CheckboxFieldView(checked: .constant(false),
                                              text: "Не показывать игры с резервом")
                            CheckboxFieldView(checked: .constant(false),
                                              text: "Для всех желающих (без заявок)")
                        }
                        
                        
                        Text("Тип игры")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium18)
                        
                        HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 6)) {
                            Text("Футбол")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular16)
                                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                                .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.secondaryColor))
                            
                            Text("Мини-футбол")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular16)
                                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                                .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.secondaryColor))
                            
                            Text("Футзал")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoRegular16)
                                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 10))
                                .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 6))
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.secondaryColor))
                            Spacer()
                        }
                        
                        Text("Где играть")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium18)
                        
                        HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 6)) {
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
                    }
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
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
        .frame(width: width,
               height: height * Size.shared.getAdaptSizeHeight(px: 670))
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


struct FilterGameSheet_Previews: PreviewProvider {
    static var previews: some View {
        FilterGameSheet(isSheetActive: .constant(true))
    }
}
