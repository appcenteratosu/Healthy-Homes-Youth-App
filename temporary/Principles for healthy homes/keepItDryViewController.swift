import UIKit

class keepItDryViewController: UIViewController {
    
    let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it DRY|" + "Damp homes provide an environment for dust mites, roaches, rodents and molds..."
    
    
    @IBOutlet weak var bookmarkButtonSelected: UIButton!
    
    @IBOutlet var BottomNavButtons: [UIButton]!
    
    @IBAction func UnwindDryToPrinciple(_ sender: UIButton) {
        performSegue(withIdentifier: "UnwindDryToPrinciple", sender: nil)
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = UIScreen.main.bounds
        
        for button in BottomNavButtons {
            if frame.height > 850 && frame.width > 450  {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            }
            else
            {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            }
        }
    
        var value = false
        value = UserDefaults.standard.bool(forKey: key)
//        configureCheckmark()
       // change the status of button based on "value"
        if value == true {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "liked heart icon"), for: UIControlState.normal)
        } else {
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
        
//            DryTextView.contentInset = UIEdgeInsetsMake(5,5,5,5)
//        DryTextView.adjustsFontForContentSizeCategory = true
//
//
//
//            DryTextView.textAlignment = .center
//        DryTextView.textContainer.maximumNumberOfLines = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        let key = "bookmarks|" + "Eight Principles of Healthy Homes|" + "Keep it DRY|" + "Damp homes provide an environment for dust mites, roaches, rodents and molds..."
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
            
            bookmarkButtonSelected.setBackgroundImage(UIImage(named: "fav heart "), for: UIControlState.normal)
        }
    }

}
