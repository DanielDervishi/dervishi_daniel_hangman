
import Foundation
import UIKit
//Animations struct for simple animations access
struct Animation{
//Simple transition from top animation
    static func normal(image: UIImage, speed: Double, imageView: UIImageView, transition: UIView.AnimationOptions){
    imageView.image = image
    UIImageView.transition(with: imageView,duration: speed,options: transition,animations: {},completion: nil)
        UIImageView.animate(withDuration: 1, animations: {
            imageView.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        })
        UIImageView.animate(withDuration: 1, animations: {
            imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
            
        }
    static func withLabel(label: UILabel, scale: Float){
        UILabel.animate(withDuration: 1, animations: {
            label.transform = CGAffineTransform(scaleX: CGFloat(scale + 0.7), y: CGFloat(scale + 0.7))
        })
        UILabel.animate(withDuration: 1, animations: {
            label.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        
    }
}

