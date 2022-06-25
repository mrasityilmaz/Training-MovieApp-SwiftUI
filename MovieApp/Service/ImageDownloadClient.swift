//
//  ImageDownloadClient.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 22.06.2022.
//

import Foundation


class ImageDownloadClient : ObservableObject {
    
    @Published var downloadedImage : Data?
    
    
    func downloadImage(url: String){
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        
        URLSession.shared.dataTask(with: imageUrl) { data, repsonse, error in
            guard let data = data, error == nil  else {
                return
            }
            
            
            DispatchQueue.main.async {
                self.downloadedImage = data
            }

        }.resume()
        
        
    }
}
