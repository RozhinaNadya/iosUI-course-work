//
//  Extensions(UIAlert).swift
//  MyHabits
//
//  Created by Надежда on 2022-04-26.
//

import UIKit

extension UIAlertController {
    
    class var noTittleAlert: UIAlertController {
        let alert = UIAlertController(title: "No Title", message: "You can't save a habit without a title", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
    class var yourProgressAlert: UIAlertController {
        let alert = UIAlertController(title: "Your progress", message: "Mark the habit and monitor your progress", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
}
