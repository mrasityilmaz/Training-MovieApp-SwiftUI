//
//  SplashView.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 23.06.2022.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive:Bool = false
    
    
    @State var progressValue : Double = 0
    
    var body: some View {
        if self.isActive {
           
            MainScreen()
        } else {
           
            VStack(spacing:60) {
            
                
                
                
               
            
             
                    Image("LaunchImage")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(30)
                        .shadow(color: .red.opacity(0.3), radius: 10, x: 5, y: 10)
               
                           
                     
                    
                    
                
                ZStack(alignment:.leading) {
                    
                    HStack {
                        Spacer()
                        Text("Loading...")
                            .padding(.trailing,10)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8 , height: 30)
                    
                    
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: UIScreen.main.bounds.width * 0.8 , height: 30)
                        .foregroundColor(.secondary.opacity(0.4))
                    
                    
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: progressValue , height: 30)
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [.blue,.red]), startPoint: .leading, endPoint: .trailing).clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous)))
                }
                
                    
                        
                        
                    
                
                    
               
                    
                
                
                
                
                
                
                
                
            }
         
            .ignoresSafeArea()
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    withAnimation(.linear(duration: 2)) {
                        progressValue += (UIScreen.main.bounds.width * 0.8) 
              
                    }
                   
                    
                }
              
                
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
              
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
