//
//  NetworkManager.swift
//  StoiQuote
//
//  Created by Jayvee Ballesteros on 5/21/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var quotes = Quote(author: "Made with ♥️ by Jayvee Ballesteros", body: "StoiQuote")
    
    func fetchData() {
        
        if let url = URL(string: "https://stoicquotesapi.com/v1/api/quotes/random") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                        let results = try decoder.decode(Quote.self, from: safeData)
                            DispatchQueue.main.async {
                                self.quotes = results
                            }
                        } catch {
                            print(error)
                        }
                    }
                   
                } else {
                    print(error as Any)
                }
            }
            task.resume()
        }
    }
}
