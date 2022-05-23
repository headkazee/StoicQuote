//
//  QuoteData.swift
//  StoiQuote
//
//  Created by Jayvee Ballesteros on 5/21/22.
//

import Foundation
import SwiftUI



struct Quote: Decodable {
    var author: String
    var body: String
}

struct CustomColor {
    
    static func randomBGColor() -> Color {
        
        let backgroundColor = [
            Color(red: 0.263, green: 0.365, blue: 0.337), // #435d56
            Color(red: 0.557, green: 0.584, blue: 0.478), // #8e957a
            Color(red: 0.588, green: 0.345, blue: 0.275), // #965846
        ]
        let bgColor = backgroundColor.randomElement()!
        return bgColor
    }
    
    
}
