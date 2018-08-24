
import UIKit

class TemperatureControlledViewController: UIViewController {

    @IBOutlet weak var bookmarkButtonSelected: UIButton!
    let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it TEMPERATURE CONTROLLED|" + "Homes that do not have balanced and consistent temperatures..."

    @IBAction func UnwindTempToPrinciple(_ sender: Any) {
        performSegue(withIdentifier: "UnwindTempToPrinciple", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var value = false
        value = UserDefaults.standard.bool(forKey: key)
        //        configureCheckmark()
        // change the status of button based on "value"
        if value == true {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart"), for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it TEMPERATURE CONTROLLED|" + "Homes that do not have balanced and consistent temperatures..."
        var existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        
        existingAnswer = !existingAnswer!
        
        if existingAnswer! {
            UserDefaults.standard.set(true, forKey: key)
            UserDefaults.standard.synchronize()
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            UserDefaults.standard.set(false, forKey: key)
            UserDefaults.standard.synchronize()
            
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart"), for: UIControlState.normal)
        }
    }
    
}
