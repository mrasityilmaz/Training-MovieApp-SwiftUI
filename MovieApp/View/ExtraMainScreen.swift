//
//  ExtraMainScreen.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 23.06.2022.
//

import SwiftUI

struct ExtraMainScreen: View {
    var body: some View {
        ScrollView{
            GeometryReader{proxy in
                
                Color.clear.preference(key: ScrollPreferenceKey.self, value: <#T##PreferenceKey.Value#>)
                
            }
        }
    }
}

struct ExtraMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExtraMainScreen()
    }
}
