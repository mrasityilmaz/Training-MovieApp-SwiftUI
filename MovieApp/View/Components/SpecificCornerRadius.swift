//
//  SpecificCornerRadius.swift
//  MovieApp
//
//  Created by Muhammed Raşit Yılmaz on 23.06.2022.
//

import Foundation
import SwiftUI
import UIKit


struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
