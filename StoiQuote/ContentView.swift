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


struct ContentView: View {
    
    @State var quote = StoicData(data: Data(author: "emelyn", quote: "eme"))
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(quote.data.quote)")
            Text("\(quote.data.author)")
            Button("Next") {
                self.fetchData()
            }
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
    }
}
