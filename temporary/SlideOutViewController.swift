import UIKit

class SlideOutViewController: UIViewController {
    
    
    @IBOutlet var HealthyHomesButton: [UIButton]!
    
    @IBOutlet var BigStuffButton: [UIButton]!
    
    @IBOutlet var CheckItTwiceButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func familyHomesSelection(_ sender: Any) {
        HealthyHomesButton.forEach { (button) in
            button.isHidden = !button.isHidden
        }
    }
    
    @IBAction func BigStuffSelection(_ sender: Any) {
        BigStuffButton.forEach { (button) in
            button.isHidden = !button.isHidden
            
        }
    }
    
    @IBAction func CheckItTwiceSelection(_ sender: Any) {
        CheckItTwiceButton.forEach { (button) in
            button.isHidden = !button.isHidden
        }
    }
    
    
    
    @IBAction func keepItDryTouched(_ sender: UIButton) {
        let mainStoreboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "keepItDryViewController") as! keepItDryViewController
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    
}
