//
//  AppFont.swift
//  BBCWeather
//
//  Created by Gerard Ward on 24/11/2020.
//  Copyright © 2020 BBC. All rights reserved.
//

import SwiftUI

extension Text {
    func appFont(reithFont: ReithFont, size: CGFloat, colour: Color = .white) -> Text {
       return self
            .font(.custom(reithFont.name, fixedSize: size)) // need to prevent out of the box dynamic type for custom fonts
            .foregroundColor(colour)
    }
}


private struct BBCFontModifier: ViewModifier {
    
    let font: ADSFont
    let colour: Color
    
    func body(content: Content) -> some View {
        content
            .font(font.fontStyle)
            .foregroundColor(colour)
            .lineSpacing(font.lineHeight)
            .frame(minHeight: font.lineHeight)
//            .padding(.vertical, (font.lineHeight - font.size)/2 )
    }
}

extension View {
    func bbcFont(font: ADSFont, colour: Color) -> some View {
        self.modifier(BBCFontModifier(font: font, colour: colour))
    }
}
/*
"BBCReithSans-Bold"
"BBCReithSans-Regular"
"BBCReithSans-Medium"
"BBCReithSans-Light"
 */

struct ADSFont {
    let size: CGFloat
    let lineHeight: CGFloat
    let name: String
    
    var fontStyle: Font {
        .custom(name, size: size)
    }
    
    static let largeTitleRegular: ADSFont = .init(size: 34, lineHeight: 41, name: ReithFont.regular.name)
    
    static let largeTitleEmphasised: ADSFont = .init(size: 28, lineHeight: 34, name: ReithFont.bold.name)
    
    static let title1: ADSFont = .init(size: 28, lineHeight: 34, name: ReithFont.regular.name)
    
    static let title2: ADSFont = .init(size: 22, lineHeight: 28, name: ReithFont.regular.name)
    
    static let title3: ADSFont = .init(size: 20, lineHeight: 25, name: ReithFont.regular.name)
    
    static let headline: ADSFont = .init(size: 17, lineHeight: 22, name: ReithFont.medium.name)
    
    static let body: ADSFont = .init(size: 17, lineHeight: 22, name: ReithFont.regular.name)
    
    static let callout: ADSFont = .init(size: 16, lineHeight: 21, name: ReithFont.regular.name)
    
    static let subhead: ADSFont = .init(size: 15, lineHeight: 20, name: ReithFont.regular.name)
    
    static let footnote: ADSFont = .init(size: 13, lineHeight: 18, name: ReithFont.regular.name)
    
//    static let font0: ADSFont = .init(size: height, lineHeight: 41, fontStyle: .system(size: height))
//    
//    static let font2: ADSFont = .init(size: height, lineHeight: 41, fontStyle: .custom("AppleSDGothicNeo-Regular", size: height))
//    
//    static let font3: ADSFont = .init(size: height, lineHeight: 41, fontStyle: .custom("AvenirNextCondensed-Regular", fixedSize: height))
//    
//    static let font4: ADSFont = .init(size: height, lineHeight: 41, fontStyle: .custom("ChalkboardSE-Regular", fixedSize: height))
//    
//    static let font5: ADSFont = .init(size: height, lineHeight: 41, fontStyle: .custom("GranthaSangamMN-Regular", fixedSize: height))
//    
//    static let font6: ADSFont = .init(size: height, lineHeight: 41, fontStyle: .custom("GranthaSangamMN-Regular", size: height, relativeTo: .largeTitle))
//    
//    static let apple: ADSFont = .init(size: height, lineHeight: 41, fontStyle: .custom(".AppleSystemUIFont", fixedSize: height))
    
//    static let LargeTitleEmphasised: ADSFont = .init(size: 34, lineHeight: 41, fontStyle: .bold)
//    
//    static let headline: ADSFont = .init(size: 17, lineHeight: 22, fontStyle: .regular)
//    
//    static let bodyEmphasised: ADSFont = .init(size: 17, lineHeight: 22, fontStyle: .medium)
}

