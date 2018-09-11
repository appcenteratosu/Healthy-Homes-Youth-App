
import UIKit
import CoreGraphics

class CenterViewController: UIViewController {
  var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions

    @IBOutlet weak var bigSpeechBubbleLabel: UILabel!
    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    @IBOutlet weak var WhatToKnowButton: UIButton!
    
    let formattedString = NSMutableAttributedString()
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        MenuButton.setBackgroundImage(UIImage(named: "hamburger menu"), for: UIControlState.normal, barMetrics: .default)
        
//        formattedString.normal("Healthy Homes ")
//        formattedString.bold("Youth")
//        
//        TitleLabel.attributedText = formattedString
        
       bigSpeechBubbleLabel.text = "\u{2022} Everyone deserves to live in a healthy home. A home can support the health of your family as much as a healthy lifestyle and diet. \n\u{2022} It’s important for people of all ages to know how to make their home safe and healthy for their own health concerns.\n\u{2022} It is always worth taking the time to make the place you call home a healthier and safer place to live!"
        
        let frame = UIScreen.main.bounds
        if frame.height > 850 && frame.width > 450 {
            WhatToKnowButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            WhatToKnowButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }

    }
   
  @IBAction func puppiesTapped(_ sender: Any) {
    delegate?.toggleRightPanel?()
  }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [.font: UIFont(name: "helvetica neue",size: 15)!]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
