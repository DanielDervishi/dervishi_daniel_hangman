import Foundation
import UIKit
struct Alerts {
    
    //Alert box with "OK" only and no action is required
    static func showBasicAlert (on vc: UIViewController, title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
    //Alert box with "OK" and action is required
    static func showActionAlertWithOkayOnly (on vc: UIViewController, with title: String, message:String, okayAction: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okayAction))
        vc.present(alert, animated: true)
    }
    
    //Alert box with "OK" and "Cancel" and action is required for "OK" only
    static func showActionAlertWithOkay (on vc: UIViewController, with title: String, message:String, okayAction: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okayAction))
        vc.present(alert, animated: true)
    }

    //Alert box with "OK" and "Cancel" and action is required for both
    static func showActionAlertWithOkayAndCancel (on vc: UIViewController, with title: String, message:String, okayAction: @escaping (UIAlertAction) -> Void, cancelAction: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okayAction))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: cancelAction))
        vc.present(alert, animated: true)
    }
    static func showActionAlertWithOkayAndReset (on vc: UIViewController, with title: String, message:String, resetAction: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: resetAction))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
    // Alert box with a textfield and one action. This functions returns a string, returned string is the value entered by end user when action is pressed
    static func showWithTextField (on vc: UIViewController, with title: String, message: String, actionTitle: String, textFieldPlaceholder: String) -> String{
       
        var myReturnedString = ""
        var actionPressed: Bool = false
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        myAlert.addTextField(configurationHandler: {
            textField in textField.placeholder = textFieldPlaceholder
            
        })
        
        myAlert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: {_ in
            print(myAlert.textFields!.first!.text!)
            if let myString = myAlert.textFields?.first?.text {
                myReturnedString = myString
            }
            actionPressed = true
            
        }))
        
        
        vc.present(myAlert, animated: true)
        
        if actionPressed {
            return myReturnedString
        } else {
            return "nothning entered yet OR nothing entered at all"
        }
  
    }
    

}
