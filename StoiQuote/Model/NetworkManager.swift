//
//  NetworkManager.swift
//  StoiQuote
//
//  Created by Jayvee Ballesteros on 5/21/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var quotes = Quote(author: "Made with ♥️ by Jayvee Ballesteros", quote: "StoiQuote")
    
    func fetchData() {
        
        if let url = URL(string: "https://api.themotivate365.com/stoic-quote") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                        let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.quotes = results.hits
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
