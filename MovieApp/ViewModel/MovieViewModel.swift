//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 22.06.2022.
//

import Foundation
import SwiftUI


class MovieMainViewModel  : ObservableObject {
    
    @Published var  movieList = [MovieViewModel]()
    
    
    @Published var currentMovieDetails : MovieDetailViewModel?
    
    
    
    init(){
        self.currentMovieDetails = nil
    }
    
    
    
   
    
    
    
    
    let client =  ApiClient()
    
    
    
    func searchMovieByName(searchName: String){
        client.searchMovies(search: searchName) { result in
            
            switch result {
                
            case.failure(let error):
                print(error)
                
            case.success(let resultMovies):
                if let resultMovies = resultMovies {
                    DispatchQueue.main.async {
                        self.movieList = resultMovies.map(MovieViewModel.init)
                    }
                }
                
                
            }
        }
    }
    
    
    
    func getMovieDetailsByID(movieID: String){
        client.getMovieDetails(movieID: movieID) { result in
            
            switch result {
                
            case.failure(let error):
                print(error)
                
            case.success(let movieDetails):
              
                    DispatchQueue.main.async {
                        self.currentMovieDetails = MovieDetailViewModel.init(movieDetail: movieDetails)
                    }
                
                
                
            }
        }
    }
    
    
    
   
    
    
}





struct MovieViewModel {
    
    let movie : Movie
    
    var movieID : String{
        movie.imdbID
    }
    
    var title : String{
        movie.title
    }
    
    var posterUrl : String{
        movie.poster
    }
   
    var year : String{
        movie.year
    }
    
}





struct MovieDetailViewModel {
    
    let movieDetail : MovieDetail
    
    var  imdbID: String{
        movieDetail.imdbID
    }
    
    var title : String{
        movieDetail.title
    }
    
    var year : String{
        movieDetail.year
    }
    
    
    var plot : String{
        movieDetail.plot
    }
    
    
    var genre : String{
        movieDetail.genre
    }
    
    var posterUrl : String{
        movieDetail.poster
    }
    
 
    
    var rating : String{
        movieDetail.imdbRating
    }
    
    var actors : String{
        movieDetail.actors
        
    }
    
    var boxOffice : String{
        movieDetail.boxOffice
        
    }
    
  
    
   
    
}
