//
//  ApiClient.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 22.06.2022.
//

import Foundation



class ApiClient {
    
    
    private let myApiKey = "12e7faa2"
   private let apiBaseUrl = "https://www.omdbapi.com/?"
    
  
    
    
    func searchMovies(search : String ,completion : @escaping ((Result<[Movie]?, ClientError>) -> Void)){
        
        guard let url = URL(string :"\(apiBaseUrl)s=\(search)&apikey=\(myApiKey)")  else {
            return completion(.failure(.veriDogruDegil))
        }
        
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil   else {
                return completion(.failure(.veriDogruDegil))
            }
            
            guard let result = try? JSONDecoder().decode(MovieSearchResult.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            
            completion(.success(result.searchResult))

        }
        .resume()
        
        
        
    }
    
    
    
    func getMovieDetails(movieID : String ,completion : @escaping ((Result<MovieDetail, ClientError>) -> Void)){
        
        guard let url = URL(string :"\(apiBaseUrl)i=\(movieID)&apikey=\(myApiKey)")  else {
            return completion(.failure(.veriDogruDegil))
        }
        
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil   else {
                return completion(.failure(.veriDogruDegil))
            }
            
            guard let result = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            
            completion(.success(result))
            
        }
        .resume()
        
        
        
    }
    
}



enum ClientError : Error{
    case veriIslenemedi
    case veriDogruDegil
}
