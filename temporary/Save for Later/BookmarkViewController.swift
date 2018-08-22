import UIKit

class BookmarkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.chapteAndSubChapterNames.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookmarkTableView.dequeueReusableCell(withIdentifier: "bookmarks", for: indexPath)
        
        var bookmarkCell = cell.viewWithTag(1) as! UILabel

        bookmarkCell.text = chapteAndSubChapterNames[indexPath.section]
        
        return cell;
    }
    
    @IBAction func ReturnSavedForLaterToMainMenu(_ sender: Any) {
        performSegue(withIdentifier: "UnwindSavedForLaterToMainMenu", sender: nil)
    }
    
    var chapteAndSubChapterNames = [String]()
    var checkListArray = [[String]]()
    var chapter_names = [String]()
    var paragragh = String()
    var sub_chapters = [String]()
    var chapter_name = String()
    var sub_chapter = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookmarkTableView.delegate = self
        self.bookmarkTableView.dataSource = self
        self.bookmarkTableView.separatorColor = UIColor.clear
        self.bookmarkTableView.backgroundColor = UIColor.clear
        // get all keys and store in all_keys
        let all_keys = UserDefaults.standard.dictionaryRepresentation().keys
        for key in all_keys {
            if key.contains("bookmark|"){
                var value = UserDefaults.standard.value(forKey: key) as! Bool
                
                if value == true {
                var bookmarkDataOptions = key.components(separatedBy: "|") as [String]
                
                chapter_name =  bookmarkDataOptions[1]
                sub_chapter = bookmarkDataOptions[2]
                paragragh = bookmarkDataOptions[3]
                chapteAndSubChapterNames.append(chapter_name + "|" + sub_chapter + "|" + paragragh)
                }
                
            }
        }
//        self.bookmarkTableView.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.8156862745, blue: 0.9921568627, alpha: 1)
    }
    
    func tableView(_ bookmarkTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = bookmarkTableView.cellForRow(at: indexPath) {
            let bookmarkCell = cell.viewWithTag(1) as! UILabel

            
            if bookmarkCell.text! == "8Principles|" + "Dry|" + "Damp homes provide an environment for dust mites, roaches, rodents and molds..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "keepItDryViewController") as! keepItDryViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "8Principles|" + "ContaminantFree|" + "Levels of contaminants such as lead, radon, carbon monoxide, asbestos,..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "keepItContaminentFreeViewController") as! keepItContaminentFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "8Principles|" + "Pest|" + "Exposure to pests such as roaches and rodents can trigger an asthma attack..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PestsViewController") as! PestsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "8Principles|" + "Safe|" + "Injuries such as falls, burns, and poisonings occur most often..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SafeViewController") as! SafeViewController 
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "8Principles|" + "8Principles|" + "Maintained|" + "Poorly maintained homes are at risk for moisture, pest problems..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WellMaintainedViewController") as! WellMaintainedViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
                
                
            else if bookmarkCell.text == "8Principles|" + "Ventilated|" + "Having a good fresh air supply to your home is important..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WellVentilatedViewController") as! WellVentilatedViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "8Principles|" + "TempControlled|" + "Homes that do not have balanced and consistent temperatures..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TemperatureControlledViewController") as! TemperatureControlledViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "8Principles|" + "Clean|" + "Clean homes reduce pest infestation and exposures to..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CleanViewController") as! CleanViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            else if bookmarkCell.text == "BigStuff|" + "Lead1|" + "Lead poisoning is one of the biggest health risks for..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
            
            else if bookmarkCell.text == "BigStuff|" + "Lead2|" + "Lead can permanently damage your nervous..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead3|" + "Before 1978, lead was used in paint, water pipes, gasoline..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead4|" + "Run water for at least 30 seconds before drinking it..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead5|" + "Wash your hands and face often..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Lead6|" + "Stay away from areas where there..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LeadViewController") as! LeadViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies1|" + "Asthma is a lung disease. More than 7 million children in the United..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies2|" + "Asthma makes it hard to breathe. If you have as..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies3|" + " There can cause asthma attacks, and they are called..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies4|" + "Don’t allow anyone to smoke..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies5|" + "Keep pets away from bedrooms..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "AsthamaAllergies6|" + "Avoid air fresheners, incense..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsthamaAllergiesViewController") as! AsthamaAllergiesViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture1|" + "Molds are part of nature, but inside your home mold growth..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture2|" + "Many people are allergic or sensitive to mold..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture3|" + "Mold is usually found in areas of high humidity..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture4|" + "Use the exhaust fan while you are taking..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture5|" + "Tell someone of you see water and puddles..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "MoldMoisture6|" + "See if your dryer vents to the..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MoldMoistureViewController") as! MoldMoistureViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon1|" + "Radon comes from the natural radioactive breakdown..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon2|" + "When you breathe air containing radon, you..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon3|" + "Radon typically moves up through the ground..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon4|" + "Learn more about..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Radon5|" + "Have your home tested..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RadonViewController") as! RadonViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos1|" + "Asbestos fibers are dangerous if they get into the air..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos2|" + "Asbestos can cause serious long-term health problems..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos3|" + "Asbestos was commonly used in homes in the past..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos4|" + "If your home was built before 1978 and you are planning..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos5|" + "If your home has asbestos materials, do..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "Asbestos6|" + "In areas with damaged asbestos, keep activities..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AsbestosViewController") as! AsbestosViewController
                self.present(nextViewController, animated:true, completion:nil)
            }  else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals1|" + "A hazardous household chemical is a product..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals2|" + "Some hazardous products burn you or poison..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals3|" + "Examples of hazardous household chemicals..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals4|" + "Learn more about ways to go..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HouseHoldChemicals5|" + "Tell someone if you see chemicals that are not..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HouseHoldChemicalsViewController") as! HouseHoldChemicalsViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide1|" + "Carbon monoxide (CO) is a dangerous gas and it is not..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide2|" + "If you are exposed to CO, you might get headaches..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide3|" + "Fuel burning appliances and automobiles..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide4|" + "Install a carbon monoxide alarm..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide5|" + "If your carbon monoxide detector goes..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "CarbonMonoxide6|" + "Do not use your oven or stove..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CarbonMonoxideViewController") as! CarbonMonoxideViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree1|" + "Pests are unwanted living things in or around your..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree2|" + "Inside your home, mice, rats and cockroaches may trigger..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree3|" + "Pests travel into your home from outdoors or other..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree4|" + "Help clean up after cooking and..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree5|" + "Help keep your house tidy: Do not let..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "pestFree6|" + "Help clean up your yard. Keep mulch, garden..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pestFreeViewController") as! pestFreeViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl1|" + "A healthy home has comfortable temperature..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl2|" + "Homes that do not have comfortable temperatures..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl3|" + "Homes with temperature and humidity..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl4|" + "Have the heating and air conditioning systems..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl5|" + "Clean or change the air filters when they..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl6|" + "Consider having a home energy audit from your..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeTempControl7|" + "Find temporary shelter for elderly or ill family..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTempControlViewController") as! HomeTempControlViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety1|" + "Your chances of getting hurt at home are much higher..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety2|" + "Young children can get into everyday things..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety3|" + "The leading causes of death and injury in homes..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety4|" + "Help keep your home tidy: Keep..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety5|" + "Install smoke detectors on each..." {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeSafetyViewController") as! HomeSafetyViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else if bookmarkCell.text == "BigStuff|" + "HomeSafety6|" + "Keep a flashlight near your bed for..." {
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
