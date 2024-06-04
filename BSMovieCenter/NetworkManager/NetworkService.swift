//
//  NetworkService.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//

import Foundation


enum NetworkError :Error{
    case invalidUrl
    case invalidData
    case decodingError
}

class NetworkService{
//    @MainActor
//    func fetchData<T : Codable>(from url : String) async throws -> [T]{
//        guard let url = URL(string: url) else {
//            print("URL not Found")
//            return []
//        }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let (data, _) = try await URLSession.shared.data(for: urlRequest)
//        
//        let decodedData = try JSONDecoder().decode([T].self, from: data)
//        
//        return decodedData
//        
//    }
    
    @MainActor
    func fetchObjectData<T : Codable>(from url : String) async throws ->  T? {
        
        guard let url = URL(string: url) else {
            throw NetworkError.invalidUrl
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
          //  print(String(data: data, encoding: .utf8))
            
            guard (200...299) ~= (response as! HTTPURLResponse).statusCode else {
                   throw NetworkError.invalidData// Example for non-2xx responses
                 }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                return decodedObject
            }
            catch {
                print("Decoding Problem")
                throw NetworkError.decodingError
            }
            
            //return nil
        }
    }
    
    
}
