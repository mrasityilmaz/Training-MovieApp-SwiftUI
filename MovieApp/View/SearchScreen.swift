//
//  SearchScreen.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 25.06.2022.
//

import SwiftUI

struct SearchScreen: View {
    @ObservedObject var mainViewModel : MovieMainViewModel
    
    
    @State var searchingText : String = ""
    
    
    @State var cancelButton : Bool = false
    
    
    
    init(){
        self.mainViewModel = MovieMainViewModel()
        
    }
    
    var body: some View {

            
            
            VStack{
                
                
                // Search Textfield
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search something..", text: $searchingText, onCommit: {
                            self.mainViewModel.searchMovieByName(searchName: searchingText.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchingText)
                            withAnimation {
                                cancelButton.toggle()
                            }
                           
                        })
                        .onTapGesture {
                            withAnimation {
                                cancelButton.toggle()
                            }
                        }
                        
                    }
                    .padding(.all,12)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(.secondary))
                    .padding(.vertical)
                    .padding(.leading)
                    
                    HStack{
                        if cancelButton {
                            Button {
                                withAnimation {
                                    cancelButton.toggle()
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                                    searchingText = ""
                                }
                            } label: {
                                Text("Cancel")
                            }
                        }
                        
                    }
                    .padding(.trailing)
                    
                    
                    
                    
                }
               
               
                
                
                // Search result list
                List(mainViewModel.movieList,id:\.movieID){movie in
                        
                    if let movie = movie {
                        
                        NavigationLink {
                            DetailsView(id: movie.movieID)
                        } label: {
                            HStack{
                                AsyncImage(url: URL(string: movie.posterUrl)) { image in
                                    image.resizable()
                                    
                                        .frame(width: UIScreen.main.bounds.width * 0.4,height:UIScreen.main.bounds.width * 0.5)
                                    
                                    
                                    
                                    
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
                                
                                
                                VStack{
                                    Text(movie.title)
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.primary)
                                    
                                    
                                }
                                
                            }
                        }

                     
                        
                    }
                    
                }
            
                
                
            }.navigationBarTitle("Search Movie")
               
        
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchScreen()
            
        }
    }
}
