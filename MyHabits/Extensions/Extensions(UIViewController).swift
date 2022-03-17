//
//  Extensions(UIViewController).swift
//  MyHabits
//
//  Created by Надежда on 17.03.2022.
//

import UIKit

extension UIViewController {
    
    @objc func cancelHabit() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
