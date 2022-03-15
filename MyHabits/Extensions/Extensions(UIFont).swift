//
//  Extensions(UIFont).swift
//  MyHabits
//
//  Created by Надежда on 14.03.2022.
//

import UIKit

extension UIFont {
    
    class var footnoteFont: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    
    class var bodyFont: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    class var titleFont: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    class var targetTimeFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    class var timerFont: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .regular)
    }
    
    class var habitNameFont: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
}
