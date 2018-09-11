import UIKit

class BookmarkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let formattedString = NSMutableAttributedString()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chapteAndSubChapterNames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookmarkTableView.dequeueReusableCell(withIdentifier: "bookmarks", for: indexPath)
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        
        var bookmarkCell = cell.viewWithTag(1) as! UILabel
        
        var paragraphCell = cell.viewWithTag(5) as! UILabel
    
        bookmarkCell.text = chapteAndSubChapterNames[indexPath.row]
        
        paragraphCell.text = paragraghs[indexPath.row]
        
        return cell;
    }
    
    @IBAction func ReturnSavedForLaterToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "ReturnSavedForLaterToMainMenu", sender: nil)
    }
    
    var chapteAndSubChapterNames = [String]()
    var checkListArray = [[String]]()
    var chapter_names = [String]()
    var paragraghs = [String]()
    var sub_chapters = [String]()
    var chapter_name = String()
    var sub_chapter = String()
    var paragraph = String()
    
    @IBOutlet weak var MainManu: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let frame = UIScreen.main.bounds
        
       
            if frame.height > 850 && frame.width > 450  {
                MainManu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            }
            else
            {
                MainManu.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            }
        
        self.bookmarkTableView.delegate = self
        self.bookmarkTableView.dataSource = self
        self.bookmarkTableView.separatorColor = UIColor.clear
        self.bookmarkTableView.backgroundColor = UIColor.clear

        // get all keys and store in all_keys
        let all_keys = UserDefaults.standard.dictionaryRepresentation().keys
        for key in all_keys {
            if key.contains("bookmarks|"){
                var value = UserDefaults.standard.value(forKey: key) as! Bool
                
                if value == true {
                var bookmarkDataOptions = key.components(separatedBy: "|") as [String]
                
                chapter_name =  bookmarkDataOptions[1]
                sub_chapter = bookmarkDataOptions[2]
                    paragraph = bookmarkDataOptions[3]
                chapteAndSubChapterNames.append(chapter_name + " | " + sub_chapter)
                    
                    paragraghs.append(paragraph)
                    
                    
                }
                
            }
        }
//        self.bookmarkTableView.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.8156862745, blue: 0.9921568627, alpha: 1)
    }
    
    func tableView(_ bookmarkTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = bookmarkTableView.cellForRow(at: indexPath) {
            let bookmarkCell = cell.viewWithTag(1) as! UILabel
            var paragraphCell = cell.viewWithTag(5) as! UILabel

            cell.contentView.backgroundColor = UIColor.clear
            
            if bookmarkCell.text! == "Eight Principles of Healthy Homes | " + "Keep it DRY" && paragraphCell.text == "Damp homes provide an environment for dust mites, roaches, rodents and molds..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "keepItDryViewController") as! keepItDryViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "Eight Principles of Healthy Homes | " + "Keep it CONTAMINANT FREE" && paragraphCell.text == "Levels of contaminants such as lead, radon, carbon monoxide, asbestos,..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "keepItContaminentFreeViewController") as! keepItContaminentFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "Eight Principles of Healthy Homes | " + "Keep it PEST FREE" && paragraphCell.text == "Exposure to pests such as roaches and rodents can trigger an asthma attack..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PestsViewController") as! PestsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "Eight Principles of Healthy Homes | " + "Keep it SAFE" && paragraphCell.text == "Injuries such as falls, burns, and poisonings occur most often..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SafeViewController") as! SafeViewController 
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "Eight Principles of Healthy Homes | " + "Keep it WELL MAINTAINED" && paragraphCell.text == "Poorly maintained homes are at risk for moisture, pest problems..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WellMaintainedViewController") as! WellMaintainedViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
                
                
            else if bookmarkCell.text == "Eight Principles of Healthy Homes | " + "Keep it WELL VENTILATED" && paragraphCell.text == "Having a good fresh air supply to your home is important..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WellVentilatedViewController") as! WellVentilatedViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "Eight Principles of Healthy Homes | " + "Keep it TEMPERATURE CONTROLLED" && paragraphCell.text == "Homes that do not have balanced and consistent temperatures..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TemperatureControlledViewController") as! TemperatureControlledViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "Eight Principles of Healthy Homes | " + "Keep it CLEAN" && paragraphCell.text == "Clean homes reduce pest infestation and exposures to ..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CleanViewController") as! CleanViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "The Big Stuff | " + "Lead" && paragraphCell.text == "Lead poisoning is one of the biggest health risks for..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            
            else if bookmarkCell.text == "The Big Stuff | " + "Lead" && paragraphCell.text == "Lead can permanently damage your nervous..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Lead" && paragraphCell.text == "Before 1978, lead was used in paint, water pipes, gasoline..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Lead" && paragraphCell.text == "Run water for at least 30 seconds before drinking it..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Lead" && paragraphCell.text == "Wash your hands and face often..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Lead" && paragraphCell.text == "Stay away from areas where there..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "AsthamaAllergies" && paragraphCell.text == "Asthma is a lung disease. More than 7 million children in the United..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "AsthamaAllergies" && paragraphCell.text == "Asthma makes it hard to breathe. If you have as..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "AsthamaAllergies" && paragraphCell.text == "There can cause asthma attacks, and they are called..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asthama&Allergies" && paragraphCell.text == "Don’t allow anyone to smoke..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asthama&Allergies" && paragraphCell.text == "Keep pets away from bedrooms..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asthama&Allergies" && paragraphCell.text == "Avoid air fresheners, incense..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Mold&Moisture" && paragraphCell.text == "Molds are part of nature, but inside your home mold growth..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Mold&Moisture" && paragraphCell.text == "Many people are allergic or sensitive to mold..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Mold&Moisture" && paragraphCell.text == "Mold is usually found in areas of high humidity..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Mold&Moisture" && paragraphCell.text == "Use the exhaust fan while you are taking..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Mold&Moisture" && paragraphCell.text == "Tell someone of you see water and puddles..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Mold&Moisture" && paragraphCell.text == "See if your dryer vents to the..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Radon" && paragraphCell.text == "Radon comes from the natural radioactive breakdown..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Radon" && paragraphCell.text == "When you breathe air containing radon, you..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Radon" && paragraphCell.text == "Radon typically moves up through the ground..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Radon" && paragraphCell.text == "Learn more about..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Radon" && paragraphCell.text == "Have your home tested..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asbestos" && paragraphCell.text == "Asbestos fibers are dangerous if they get into the air..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asbestos" && paragraphCell.text == "Asbestos can cause serious long-term health problems..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asbestos" && paragraphCell.text == "Asbestos was commonly used in homes in the past..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asbestos" && paragraphCell.text == "If your home was built before 1978 and you are planning..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asbestos" && paragraphCell.text == "If your home has asbestos materials, do..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "Asbestos" && paragraphCell.text == "In areas with damaged asbestos, keep activities..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            }  else if bookmarkCell.text == "The Big Stuff | " + "HouseHoldChemicals" && paragraphCell.text == "A hazardous household chemical is a product..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HouseHoldChemicals" && paragraphCell.text == "Some hazardous products burn you or poison..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HouseHoldChemicals" && paragraphCell.text == "Examples of hazardous household chemicals..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HouseHoldChemicals" && paragraphCell.text == "Learn more about ways to go..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HouseHoldChemicals" && paragraphCell.text == "Tell someone if you see chemicals that are not..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "CarbonMonoxide" && paragraphCell.text == "Carbon monoxide (CO) is a dangerous gas and it is not..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "CarbonMonoxide" && paragraphCell.text == "If you are exposed to CO, you might get headaches..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "CarbonMonoxide" && paragraphCell.text == "Fuel burning appliances and automobiles..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "CarbonMonoxide" && paragraphCell.text == "Install a carbon monoxide alarm..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "CarbonMonoxide" && paragraphCell.text == "If your carbon monoxide detector goes..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "CarbonMonoxide" && paragraphCell.text == "Do not use your oven or stove..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "pestFree|" && paragraphCell.text == "Pests are unwanted living things in or around your..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "pestFree" && paragraphCell.text == "Inside your home, mice, rats and cockroaches may trigger..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "pestFree" && paragraphCell.text == "Pests travel into your home from outdoors or other..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "pestFree" && paragraphCell.text == "Help clean up after cooking and..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "pestFree" && paragraphCell.text == "Help keep your house tidy: Do not let..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "pestFree" && paragraphCell.text == "Help clean up your yard. Keep mulch, garden..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeTempControl" && paragraphCell.text == "A healthy home has comfortable temperature..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeTempControl" && paragraphCell.text == "Homes that do not have comfortable temperatures..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeTempControl" && paragraphCell.text == "Homes with temperature and humidity..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeTempControl" && paragraphCell.text == "Have the heating and air conditioning systems..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeTempControl" && paragraphCell.text == "Clean or change the air filters when they..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeTempControl" && paragraphCell.text == "Consider having a home energy audit from your..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeTempControl" && paragraphCell.text == "Find temporary shelter for elderly or ill family..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeSafety" && paragraphCell.text == "Your chances of getting hurt at home are much higher..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeSafety" && paragraphCell.text == "Young children can get into everyday things..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeSafety" && paragraphCell.text == "The leading causes of death and injury in homes..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeSafety" && paragraphCell.text == "Help keep your home tidy: Keep..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeSafety" && paragraphCell.text == "Install smoke detectors on each..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "The Big Stuff | " + "HomeSafety" && paragraphCell.text == "Keep a flashlight near your bed for..." {
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

