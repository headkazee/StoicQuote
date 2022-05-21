//
//  QuoteData.swift
//  StoiQuote
//
//  Created by Jayvee Ballesteros on 5/21/22.
//

import Foundation
import SwiftUI

struct Results: Decodable {
    var hits: Quote
}

struct Quote: Decodable {
    var author: String
    var quote: String
}

struct CustomColor {
    static let fontColor = Color("fontColor")
}
