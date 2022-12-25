//
//  HeartView.swift
//  FullStackSwiftU
//
//  Created by Thomas Nyuma on 12/25/22.
//

import Foundation
import SwiftUI

struct Heart: View {
    let isFilled: Bool;
    
    var body: some View {
        Image(systemName: isFilled ? "heart.fill" : "heart")
            .foregroundColor(isFilled ? .red : .secondary)
    }
}

struct HeartSymbol_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Heart(isFilled: true)
            Heart(isFilled: false)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
