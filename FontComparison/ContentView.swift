//
//  ContentView.swift
//  FontComparison
//
//  Created by Kyle O Henderson on 13/09/2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        ComparisonView()
    }
}

#Preview {
    ContentView()
}



struct TextRepresentable3: UIViewRepresentable {
    
    let text: String
    let font: ADSFont
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: font.name, size: font.size)
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = font.lineHeight
        paragraphStyle.minimumLineHeight = font.lineHeight
        paragraphStyle.lineBreakMode = .byTruncatingTail
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        uiView.attributedText = attrString
        uiView.sizeToFit()
    }
    
    typealias UIViewType = UILabel
    
    
}

struct ComparisonView: View {
    typealias Entity = (String, Font, ADSFont)
    let font = UIFont(name: ReithFont.regular.name, size: 18)
    init() {
        for family in UIFont.familyNames {
            let names = UIFont.fontNames(forFamilyName: family)
            print("ZZZ \(family), fonts: \(names)")
        }
    }
    let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789"
    
    let fonts = [
        ("largeTitle", Font.largeTitle, ADSFont.largeTitleRegular),
        ("title", Font.title, ADSFont.title1),
        ("title2", Font.title2, ADSFont.title2),
        ("title3", Font.title3, ADSFont.title3),
        ("headline", Font.headline, ADSFont.headline),
        ("body", Font.body, ADSFont.body),
        ("callout", Font.callout, ADSFont.callout),
        ("subheadline", Font.subheadline, ADSFont.subhead),
        ("footnote", Font.footnote, ADSFont.footnote)
    ]
    
    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nibh ligula, viverra ac maximus vitae, ultricies eget ante."
    
    @State var selected: Entity = ("largeTitle", Font.largeTitle, ADSFont.largeTitleRegular)
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ForEach(fonts, id: \.self.0) { val in
                            Button {
                               selected = val
                            } label: {
                                Text(val.0)
                                    .foregroundStyle(.black)
                                    .padding(.vertical)
                            }
                            .frame(maxWidth: .infinity)
                            .background(val.0 == selected.0 ? .gray : .blue)
                        }
                    }
                }.frame(width: geo.size.width/3)
//                    .background(.red)
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(text)
                            .font(selected.2.fontStyle)
                        Text(text)
                            .font(selected.1)
                        
                        ForEach(chars.map{$0}, id: \.self) { val in
                            HStack(alignment: .bottom, spacing: 0) {
                                Rectangle().frame(width: 5, height: selected.2.lineHeight)
//                                TextRepresentable3(text: val.description, font: .largeTitleRegular)
//                                    .fixedSize()
//                                    .border(.black)
                                Text(val.description)
                                    .font(selected.2.fontStyle)
                                    .border(.black)
                                Text(val.description)
                                    .font(selected.1)
                                    .border(.black)
                                Rectangle().frame(width: 5, height: selected.2.lineHeight)
                                
                            }
                            .border(.black)
                        }
                    }
                }.frame(width: 2*geo.size.width/3)
//                    .background(.blue)
            }.frame(maxWidth: .infinity)
        }
    }
}
