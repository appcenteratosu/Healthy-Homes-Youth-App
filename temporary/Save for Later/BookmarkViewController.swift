import UIKit

class BookmarkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapteAndSubChapterNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookmarkTableView.dequeueReusableCell(withIdentifier: "bookmarks", for: indexPath)
        
        var bookmarkCell = cell.viewWithTag(1) as! UILabel
        bookmarkCell.text = chapteAndSubChapterNames[indexPath.row]
        
        return cell;
    }
    
    var chapteAndSubChapterNames = [String]()
    var checkListArray = [[String]]()
    var chapter_names = [String]()
    var sub_chapters = [String]()
    var chapter_name = String()
    var sub_chapter = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookmarkTableView.delegate = self
        self.bookmarkTableView.dataSource = self
        self.bookmarkTableView.separatorColor = UIColor.clear
        // get all keys and store in all_keys
        let all_keys = UserDefaults.standard.dictionaryRepresentation().keys
        for key in all_keys {
            if key.contains("bookmark|"){
                var value = UserDefaults.standard.value(forKey: key) as! Bool
                
                if value == true {
                var bookmarkDataOptions = key.components(separatedBy: "|") as [String]
                
                chapter_name =  bookmarkDataOptions[1]
                sub_chapter = bookmarkDataOptions[2]
                chapteAndSubChapterNames.append(chapter_name + "|" + sub_chapter)
                }
                
            }
        }
    }
    
    func tableView(_ bookmarkTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = bookmarkTableView.cellForRow(at: indexPath) {
            let bookmarkCell = cell.viewWithTag(1) as! UILabel
            
            if bookmarkCell.text == "8Principles|" + "Dry" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "keepItDryViewController") as! keepItDryViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "8Principles|" + "ContaminantFree" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "keepItContaminentFreeViewController") as! keepItContaminentFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "8Principles|" + "Pest" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PestsViewController") as! PestsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "8Principles|" + "Safe" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SafeViewController") as! SafeViewController 
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl7" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety1" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety2" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety3" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety4" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety5" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety6" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            }           
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var bookmarkTableView: UITableView!
    
}
