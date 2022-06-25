//
//  MovieModel.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 22.06.2022.
//



import Foundation


class MovieSearchResult: Codable {
    let searchResult: [Movie]
    let totalResults, response: String
    
    enum CodingKeys: String, CodingKey {
        case searchResult = "Search"
        case totalResults
        case response = "Response"
    }
    
    init(searchResult: [Movie], totalResults: String, response: String) {
        self.searchResult = searchResult
        self.totalResults = totalResults
        self.response = response
    }
}


class Movie: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
    
    init(title: String, year: String, imdbID: String, type: TypeEnum, poster: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
