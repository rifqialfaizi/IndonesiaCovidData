//
//  ApiServices.swift
//  FetchJSONCovid
//
//  Created by Rifqi Alfaizi on 04/02/21.
//

import Foundation
import SwiftUI
import Combine

class ApiService: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var dataTotal = [Total](){
        willSet {
            objectWillChange.send()
        }
    }
    // pakai true artinya kalo data belom selesai di load, animasi bakal berputar terus
    @Published var isLoading = true
    
    
    
    init() {
        guard let url = URL(string: "https://data.covid19.go.id/public/api/update.json") else {
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode(CovidResponse.self, from: data)
            
            if let result = result {
                
                // dibuat false, jika data sudah di load, animasi loading akan hilang
                self.isLoading = false
                
                DispatchQueue.main.async {
                    // update.total itu adalah dalam JSON atau link total ada dalam update
                    self.dataTotal = [result.update.total]
                    
                    print(self.dataTotal)
                }
            }
        }.resume()
        
        
    }
}
