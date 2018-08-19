import UIKit

class keepItDryViewController: UIViewController {
    
    let key = "bookmark|" + "8Principles|" + "Dry"
    
    @IBOutlet weak var bookmarkButtonSelected: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var value = false
        value = UserDefaults.standard.bool(forKey: key)
//        configureCheckmark()
       // change the status of button based on "value"
        if value == true {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        let key = "bookmark|" + "8Principles|" + "Dry"
        var existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
                UserDefaults.standard.set(true, forKey: key)
                UserDefaults.standard.synchronize()
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "checked box"), for: UIControlState.normal)
        } else {
                UserDefaults.standard.set(false, forKey: key)
                UserDefaults.standard.synchronize()
            
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "check list box (unfilled)"), for: UIControlState.normal)
        }
    }

}
