
import UIKit

class CenterViewController: UIViewController {
  var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions
    
    @IBOutlet weak var speechTextView: UITextView!
    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    @IBOutlet weak var bigSpeechBubbleSpeechBubble: UIImageView!
    
    
    let formattedString = NSMutableAttributedString()
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        MenuButton.setBackgroundImage(UIImage(named: "hamburger menu"), for: UIControlState.normal, barMetrics: .default)
        
        formattedString.normal("Healthy Homes ")
        formattedString.bold("Youth")
        
        TitleLabel.attributedText = formattedString
        
        speechTextView.translatesAutoresizingMaskIntoConstraints = false
        speechTextView.adjustsFontForContentSizeCategory = true
        
    }
   
  @IBAction func puppiesTapped(_ sender: Any) {
    delegate?.toggleRightPanel?()
  }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [.font: UIFont(name: "Times New Roman",size: 17)!]
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
