//
//  ContentView.swift
//  StoiQuote
//
//  Created by Jayvee Ballesteros on 5/20/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject var networkManager = NetworkManager()
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image(systemName: "quote.opening")
                    .resizable()
                    .frame(width: 100, height: 60, alignment: .leading)
                
                Text("\(networkManager.quotes.quote)")
                    .font(Font.custom("Fraunces", size: 70, relativeTo: .largeTitle))
                    .bold()
                    .padding(.top, 15)
                    .minimumScaleFactor(0.5)
                    .lineLimit(20)
                
                Text(networkManager.quotes.author)
                    .font(.system(size: 20.0))
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 2)
                    .padding(.bottom, 5)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.networkManager.fetchData()
                    }, label: {
                        btnView()
                    })
                    
                } //: HSTACK
            } //: VSTACK
            .foregroundColor(CustomColor.fontColor)
            .padding(25)
        } //: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}

struct btnView: View {
    var body: some View {
        HStack {
            Text("Next")
                .font(Font.custom("Fraunces", size: 30, relativeTo: .largeTitle))
                .bold()
            
            
            Image(systemName: "greaterthan.circle.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .leading)
        } //: HSTACK
        .padding()
        .foregroundColor(Color.accentColor)
        .background(CustomColor.fontColor)
        .clipShape(Capsule())
    }
}
