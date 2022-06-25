//
//  MainScreen.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 22.06.2022.
//

import SwiftUI

struct MainScreen: View {
    
    
    
    @ObservedObject var mainViewModel : MovieMainViewModel
    
    
    
    @State var hasScrolled  : Bool = false
    
    
    @State var bgUrl : String? = nil
    
    
    @State  var textFieldText : String = ""
    
    
    
    @State var isSearching = false
    
    

    
    
    
    
    
    init () {
        
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Noteworthy Bold", size: 26)!]
        self.mainViewModel = MovieMainViewModel()
        
        self.mainViewModel.searchMovieByName(searchName: "Avengers")
        
  
        
    }
    
    
    
    
    
    var body: some View {
        
           
        NavigationView{
            TabView() {
                
                
                ForEach(mainViewModel.movieList,id:\.movieID) { movie in
                    
                    
                    
                    
                    VStack {
                        Spacer()
                        
                        
                        GeometryReader {proxy in
                            
                            
                            
                            
                            VStack {
                                
                                
                                
                  
                                                
                                        
                                Text(movie.title)
                           
                                    .bold()
                                    .font(.largeTitle)
                                    
                                    .padding(.horizontal,40)
                           
                       
                                
                                    .foregroundColor(.white.opacity(0.5))
                                    .shadow(color:.black.opacity(0.6),radius: 10, x: 0, y: 10)
                                    .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / -10 ), axis: (x: 0, y: 0, z: 1))
                 
                     
                                NavigationLink {
                                    
                                    withAnimation(.interactiveSpring()) {
                                        DetailsView(id: movie.movieID)
                                           
                                    }
                                    
                                }
                                label :  {
                                    AsyncImage(url: URL(string: movie.posterUrl)) { image in
                                        image.resizable()
                                            .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 5))
                                            .cornerRadius(30)
                                        
                                            .padding(.horizontal,40)
                                   
                                            .padding(.bottom,40)
                                            .frame(height:UIScreen.main.bounds.height * 0.6)
                                            .shadow(color:.black.opacity(0.6),radius: 10, x: 0, y: 10)
                                        
                                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / -10 ), axis: (x: 0, y: 1, z: 1))
                                        
                                        
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
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                
                            }
                            .padding(.top,40)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                    }
                    
                    
                    
                }
                
                
            }
            .ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background((LinearGradient(gradient: Gradient(colors: [.blue,.red]), startPoint: .topLeading, endPoint: .bottomTrailing)))
            
            
            .navigationBarTitle("Movies", displayMode: .inline)
            .navigationBarItems( trailing: NavigationLink(
                destination: {
                    SearchScreen()
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }))
            
            
        }
        
        
        
    }
    
   
    
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
        
        
        
    }
}




