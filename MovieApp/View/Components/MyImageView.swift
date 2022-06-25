//
//  MyImageView.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 22.06.2022.
//

import SwiftUI

struct MyImageView: View {
    
    
    let url : String
    
    
    @ObservedObject var downloadClient = ImageDownloadClient()

    
    init(url:String ){
       
        self.url = url
        self.downloadClient.downloadImage(url: url)

        
    }
    

    
    var body: some View {
        if let data = self.downloadClient.downloadedImage {
            Image(uiImage: UIImage(data: data)!)
                .resizable()
                
                
        }
        else {
            Text("Hata")
        }
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView(url: "https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg")
    }
}
