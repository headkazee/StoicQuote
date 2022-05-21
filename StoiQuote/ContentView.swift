//
//  ContentView.swift
//  StoiQuote
//
//  Created by Jayvee Ballesteros on 5/20/22.
//

import SwiftUI

struct StoicData: Decodable {
    var data: Data
}

struct Data: Decodable {
    var author: String
    var quote: String
}

struct CustomColor {
    static let fontColor = Color("fontColor")
}

struct ContentView: View {
    
    @State var quote = StoicData(data: Data(author: "Made with ❤ by \nJayvee Ballesteros", quote: "StoiQuote"))
    
    
    var body: some View {
        
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image(systemName: "quote.opening")
                    .resizable()
                    .frame(width: 100, height: 60, alignment: .leading)
                
                Text("\(quote.data.quote)")
                    .font(Font.custom("Fraunces", size: 70, relativeTo: .largeTitle))
                    .bold()
                    .padding(.top, 15)
                    .minimumScaleFactor(0.5)
                    .lineLimit(20)
                
                
                Text("\(quote.data.author)")
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
                    Button(action: {self.fetchData()}, label: {
                        HStack {
                            Text("Next")
                                .font(Font.custom("Fraunces", size: 30, relativeTo: .largeTitle))
                                .bold()
                            
                            
                            Image(systemName: "greaterthan.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                        }
                        
                        .padding()
                        .foregroundColor(Color.accentColor)
                        .background(CustomColor.fontColor)
                        .clipShape(Capsule())
                    })
                    
                }
                
            }
            .foregroundColor(CustomColor.fontColor)
            
            .padding(25)
        }
        
        
    }
    
    func fetchData() {
        // create url
        let url = URL(string: "https://api.themotivate365.com/stoic-quote")
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(StoicData.self, from: data)
                        self.quote = decodedData
                    } catch {
                        print("Something went wrong.")
                    }
                }
            }
        } .resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
        
    }
}
