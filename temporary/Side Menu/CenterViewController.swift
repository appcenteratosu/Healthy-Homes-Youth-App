
import UIKit

class CenterViewController: UIViewController {
  var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions
    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        MenuButton.setBackgroundImage(UIImage(named: "hamburger menu"), for: UIControlState.normal, barMetrics: .default)
    }
  
  @IBAction func puppiesTapped(_ sender: Any) {
    delegate?.toggleRightPanel?()
  }
    
  
    
}
