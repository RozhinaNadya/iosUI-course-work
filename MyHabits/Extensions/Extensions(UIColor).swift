//
//  Extensions(UIColor).swift
//  MyHabits
//
//  Created by Надежда on 2022-04-25.
//

import UIKit

extension UIColor {
    class var allBackgroundColor: UIColor {
        guard let color = UIColor(named: "allBackgroundColor") else { return UIColor.white }
        return color
    }
}
