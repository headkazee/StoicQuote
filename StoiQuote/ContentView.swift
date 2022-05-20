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
    // Add more here...
}

struct ContentView: View {
    
    @State var quote = StoicData(data: Data(author: "Author", quote: "Quote"))
    
    
    var body: some View {
        
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image(systemName: "quote.opening")
                    .resizable()
                    .frame(width: 100, height: 60, alignment: .leading)
                    
                Text("\(quote.data.quote)")
                    .font(Font.custom("Fraunces", size: 30, relativeTo: .largeTitle))
                    .bold()
                    .padding(.top, 15)
                    
                    
                Text("\(quote.data.author)")
                    .font(.headline)
                    .padding(.top, 15)

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
                        .padding(15)
                        .foregroundColor(Color.accentColor)
                        .background(CustomColor.fontColor)
                        .cornerRadius(12)
                    })
                   
                }
                
            }
            .foregroundColor(CustomColor.fontColor)
            
            .padding(25)
        }
        
        .task {
            self.fetchData()
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
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11")
            
    }
}
