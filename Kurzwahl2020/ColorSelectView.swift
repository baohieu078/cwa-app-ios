//
//  ColorSelectView.swift
//  Kurzwahl2020
//
//  Created by Vogel, Andreas on 01.03.20.
//  Copyright © 2020 Vogel, Andreas. All rights reserved.
// https://stackoverflow.com/questions/56515871/how-to-open-the-imagepicker-in-swiftui

import SwiftUI


final class PaletteSelectViewState: ObservableObject {
    @Published var selectedPaletteName = String()
}


struct ColorSelectView: View {
    @EnvironmentObject var navigation: NavigationStack
    @EnvironmentObject var paletteViewState: PaletteSelectViewState
    @EnvironmentObject var colorManager: ColorManagement
//    let viewState: PaletteSelectViewState = PaletteSelectViewState()
    
    var body: some View {
        VStack{
            SingleActionBackView( title: "",
                                  buttonText: NSLocalizedString("Back", comment: "Navigation bar Back button"),
                                  action:{
                                    self.navigation.unwind()
            })
            VStack{
                Text("Select picture to change the colors")
                    .multilineTextAlignment(.leading)
                    .customFont(name: globalDataModel.font, style: .body)
                    .padding(.horizontal)
                HStack{
                    Button(action: {
                        self.navigation.advance(NavigationItem(
                            view: AnyView(SelectColorPalette(screenIndex: 0)))) }) {
                                Image(colorManager.getThumbnailName(withIndex: 0)).resizable()
                                    .frame(width: 100, height: 190)//.padding()
                    }.buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        self.navigation.advance(NavigationItem(
                            view: AnyView(SelectColorPalette(screenIndex: 1)))) }) {
                                Image(colorManager.getThumbnailName(withIndex: 1)).resizable()
                                    .frame(width: 100, height: 190)//.padding()
                    }.buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        self.navigation.advance(NavigationItem(
                            view: AnyView(SelectColorPalette(screenIndex: 2)))) }) {
                                Image(colorManager.getThumbnailName(withIndex: 2)).resizable()
                                    .frame(width: 100, height: 190)//.padding()
                    }.buttonStyle(PlainButtonStyle())
                }
                Spacer()
            }
        }
    }
}

struct ColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectView()
    }
}
