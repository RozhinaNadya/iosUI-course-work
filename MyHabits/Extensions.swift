//
//  Extentions.swift
//  MyHabits
//
//  Created by Надежда on 23.02.2022.
//

import UIKit

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach{ addSubview($0) }
    }
}
