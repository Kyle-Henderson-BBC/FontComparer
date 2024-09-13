//
//  ProportionalNumbersFont.swift
//  BBCWeather
//
//  Created by Gerard Ward on 24/11/2020.
//  Copyright © 2020 BBC. All rights reserved.
//

import SwiftUI

private struct ProportionalNumbersFont: ViewModifier {
    let font: ReithFont
    let fontSize: CGFloat
    
    func body(content: Content) -> some View {
        let ctFont = CTFontCreateWithName(font.name as CFString, 12, nil)
        let fontFeatureSettings: [CFDictionary] = [
            [
                kCTFontFeatureTypeIdentifierKey:     kNumberSpacingType,
                kCTFontFeatureSelectorIdentifierKey: kProportionalNumbersSelector
            ] as CFDictionary
        ]
        let fontDescriptor = CTFontDescriptorCreateWithAttributes([
            kCTFontFeatureSettingsAttribute: fontFeatureSettings
        ] as CFDictionary)
        let fontWithFeatures = CTFontCreateCopyWithAttributes(ctFont, fontSize, nil, fontDescriptor)
        return content.font(.init(fontWithFeatures))
    }
}

extension Text {
    func proportionalNumbersFont(_ font: ReithFont, fontSize: CGFloat, colour: Color = .white) -> some View {
        self.modifier(ProportionalNumbersFont(font: font, fontSize: fontSize))
            .foregroundColor(colour)
    }
}

extension Text {
    func proportionalNumbersFont(_ font: ADSFont, colour: Color = .white) -> some View {
        self.modifier(ProportionalNumbersFont(font: .medium, fontSize: font.size))
            .foregroundColor(colour)
//        self.modifier(ProportionalNumbersFont(font: font.fontStyle., fontSize: font.size))
//            .foregroundColor(colour)
    }
}
