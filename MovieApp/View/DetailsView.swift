//
//  ContentView.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 22.06.2022.
//

import SwiftUI

struct DetailsView: View {
    
    
    @ObservedObject var mainViewModel : MovieMainViewModel
    
  
    init (id:String) {
        self.mainViewModel = MovieMainViewModel()
        
        self.mainViewModel.getMovieDetailsByID(movieID: id)
        
      
    }
    
    
    
    
    
    var body: some View {
        
        
        
      
          
            if let detail = mainViewModel.currentMovieDetails {
                
           
                    VStack{
                        
                    
             
                        // Header - Poster and Movie Title...
                            VStack{
                                
                                ZStack {
                                    VStack {
                                        HeaderPoster(imgUrl: detail.posterUrl)
                                            .clipShape(RoundedCornersShape(corners: [.bottomRight,.bottomLeft], radius: 20))
                                        
                                        Spacer()
                                    }
                     
                                    
                                    
                                    VStack{
                                        Spacer()
                                        PosterFooter(detail: detail)
                                            .offset(y:-10)
                                            
                                    }
                                   
                                    
                                }
                                    
                                
                                
                               Spacer()
                                    
                            }
                            .frame(height:UIScreen.main.bounds.height * 0.5)
                        
                        
                        // Body others
                        
                      
                            ScrollView {
                                VStack {
                                    
                                   
                                    // Plot
                                    VStack{
                                        HStack {
                                            Text("Plot")
                                                .foregroundColor(.primary)
                                                .font(.title2)
                                                .bold()
                                                .padding(.trailing)
                                            
                                            Spacer()
                                            
                                        }
                                        .padding(.horizontal)
                                        
                                        HStack {
                                            Text(detail.plot)
                                                .font(.title3)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(.white)
                                            .cornerRadius(20)
                                            
                                            Spacer()
                                        }
                                            
                                        Spacer()
                                        
                                    }
                            
                                   
                                    // Genres
                                    VStack{
                                        HStack {
                                            Text("Genres")
                                                .foregroundColor(.primary)
                                                .font(.title2)
                                                .bold()
                                                .padding(.trailing)
                                            
                                            Spacer()
                                            
                                        }
                                        
                                        ScrollView(.horizontal,showsIndicators: false){
                                            
                                            HStack{
                                                
                                                ForEach(detail.genre.split(separator: ","),id:\.self){item in
                                                    
                                                    Text(item)
                                                        .foregroundColor(.primary)
                                                        .font(.headline)
                                                        .padding(.all,10)
                                                        .background(.secondary)
                                                        .cornerRadius(20)
                                                    
                                                    
                                                    
                                                    
                                                }
                                            }
                                            
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    
                                    // Actors
                                    VStack{
                                        HStack {
                                            Text("Actors")
                                                .foregroundColor(.primary)
                                                .font(.title2)
                                                .bold()
                                                .padding(.trailing)
                                            
                                            Spacer()
                                            
                                        }
                                        
                                        ScrollView(.horizontal,showsIndicators: false){
                                            
                                            HStack{
                                                
                                                ForEach(detail.actors.split(separator: ","),id:\.self){item in
                                                    
                                                    Text(item)
                                                        .foregroundColor(.primary)
                                                        .font(.headline)
                                                        .padding(.all,10)
                                                        .background(.secondary)
                                                        .cornerRadius(20)
                                                    
                                                    
                                                    
                                                    
                                                }
                                            }
                                            
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    
                                    
                                    
                                    // boxOffice
                                    VStack{
                                        HStack {
                                            Text("BoxOffice")
                                                .foregroundColor(.primary)
                                                .font(.title2)
                                                .bold()
                                                .padding(.trailing)
                                            
                                            Spacer()
                                            
                                        }
                                        
                                        HStack {
                                            Text(detail.boxOffice)
                                                .foregroundColor(.primary)
                                                .font(.title2)
                                                .bold()
                                                .padding()
                                                .background(.secondary)
                                                .cornerRadius(20)
                                                
                                            
                                            Spacer()
                                            
                                        }
                                    
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    
                                    
                                    
                                    Rectangle()
                                        .frame(height:80)
                                        .foregroundColor(.clear)
                                        .background(.clear)
                                        
                                    
                                    
                                    
                                }
                            }
                          
                            
                            
                       
                       
                     
                    
         
                       
                        
                    }
                    .ignoresSafeArea()
                   
                    
                    
            }
            else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
            
    }
    
    
    struct HeaderPoster : View{
        
        let imgUrl : String
        var body : some View{
            AsyncImage(url: URL(string: imgUrl)) { image in
                image.resizable()
                    .frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height * 0.5)
                   
                
            } placeholder: {
                VStack {
                    Spacer()
                    HStack {
                        
                        Spacer()
                        ProgressView()
                            .background{
                                Circle()
                                    .padding()
                                    .background(.white)
                                
                            }
                            .frame(alignment:.center)
                        Spacer()
                    }
                    Spacer()
                }
            }
            .overlay(LinearGradient(gradient: Gradient(
                stops: [Gradient.Stop(color: .secondary.opacity(0.7), location: 0.1),
                        Gradient.Stop(color: .black.opacity(0.8), location: 0.5)]), startPoint: .top, endPoint: .bottom))
        }
    }
    
    
    struct PosterFooter : View {
        
        let detail : MovieDetailViewModel
        var body : some View {
            
            VStack{
                
                
                
                
                HStack {
                    VStack(alignment:.leading) {
                        Text(detail.title.uppercased())
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .semibold, design: .rounded))
                        Text(detail.year)
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        
                    }
                    
                    Spacer()
                    
                    HStack(alignment:.center) {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        
                        Text(detail.rating)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                        
                        
                    }
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    
                    .background(.white.opacity(0.4))
                    .background(.black)
                    .cornerRadius(20)
                    
                    
                    
                    
                    
                    
                    
                }
                
                .padding()
                .background(.white.opacity(0.6))
                .background(.black.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding(.horizontal,10)
                .padding(.vertical,5)
                
                
                
                
                
                
                
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(id: "tt0371746")
    }
}
