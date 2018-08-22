import UIKit

class keepItDryViewController: UIViewController {
    
    let key = "bookmark|" + "8Principles|" + "Dry|" + "Damp homes provide an environment for dust mites, roaches, rodents and molds..."
    
    @IBOutlet weak var DryTextView: UITextView!
    
    @IBOutlet weak var bookmarkButtonSelected: UIButton!
    
    @IBOutlet var BottomNavButtons: [UIButton]!
    
    @IBAction func ChpaterMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "UnwindToPrincipleMenu", sender: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for eachbutton in BottomNavButtons {
  //          Padding:
            eachbutton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
 //           Min font:
            eachbutton.titleLabel?.adjustsFontSizeToFitWidth = true
   //         Corner radius:
            eachbutton.layer.cornerRadius = 5
    //        Alignment:
            eachbutton.titleLabel?.textAlignment = .center
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
        
            DryTextView.contentInset = UIEdgeInsetsMake(5,5,5,5)
        DryTextView.adjustsFontForContentSizeCategory = true
        

        
            DryTextView.textAlignment = .center
        DryTextView.textContainer.maximumNumberOfLines = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        let key = "bookmark|" + "8Principles|" + "Dry|" + "Damp homes provide an environment for dust mites, roaches, rodents and molds..."
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
