
import Foundation
import UIKit
//Very useful extension fround from stack overflow that basically goes through a string and adds a space when the index is > 0 and the index % the desired stride is equal to 0. It does this by creating an array with the seperator or character and than joining the array creating a new string
extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
extension Array {
    
    func disableAll (array: [UIButton]) {
        for index in array{
            index.isEnabled = false
        }
    }
    func disableAllUserEnabled (array: [UIButton]) {
        for index in array{
            index.isUserInteractionEnabled = false
        }
    }
    func enableAll (array: [UIButton]) {
               for index in array{
                   index.isEnabled = true
               }
        }
    func enableAllUserEnabled (array: [UIButton]) {
        for index in array{
            index.isUserInteractionEnabled = true
        }
    }
    
}
extension UIButton {
    func pressProgramically(){
        self.sendActions(for: .touchUpInside)
}
}

