//
//  NetworkAPI.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import Foundation

class NetworkAPI : RemoteDataSource {
    
    
    
    func fetchData<T : Codable>(from url: String) async throws -> T {
        
        guard let url = URL(string: url) else{
            throw NetworkError.invalidUrl
        }
        
        let urlRequest = URLRequest(url : url)
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (200...299) ~= (response as! HTTPURLResponse).statusCode else {
                   throw NetworkError.invalidData// Example for non-2xx responses
                 }
            
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            
            return decodedData
            
        }catch{
            print("Problem Decoding In Network API")
            throw NetworkError.decodingError
        }
        
        
        
    }
    
    
}
