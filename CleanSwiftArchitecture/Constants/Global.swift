//
//  Extensions.swift
//  CleanSwiftArchitecture
//
//  Created by india on 09/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import Foundation
import UIKit
import SWRevealViewController

func convertToString (obj:Any)->String {
    
    if let valueCd = obj as? NSNumber {
        return "\(valueCd)"
    } else if let valueCd = obj as? String {
        return valueCd
    }else if let valueCd = obj as? Int {
        return "\(valueCd)"
    }else if obj is NSNull {
        return ""
    }
    return "\(obj)"
}


extension UIViewController {
    /**
     Simple Alert
     */
    func showAlerButton() {
        let alert = UIAlertController(title: "Hii", message: "You can always access your action on Action Tap", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
             self.revealViewController()?.revealToggle(nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
