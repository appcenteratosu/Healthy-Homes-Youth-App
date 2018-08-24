import UIKit

protocol ChecklistSelectionDelegate: class {
    func checklistSelected(_ newMonster: Question)
}

class SlideOutViewController: UIViewController {
    
    var isChecked = Bool()
    
    weak var delegate: ChecklistSelectionDelegate?
    
    @IBOutlet var HealthyHomesButton: [UIButton]!
    
    @IBOutlet var BigStuffButton: [UIButton]!
    
    @IBOutlet var CheckItTwiceButton: [UIButton]!
    
    @IBOutlet var BigStuffImageView: [UIImageView]!
    
    @IBOutlet var FamilyBorders: [UIImageView]!
    
    @IBOutlet var BigStuffBorders: [UIImageView]!
    
    @IBOutlet var FamilyImageView: [UIImageView]!
    
    @IBOutlet var CheckItTwiceImageView: [UIImageView]!
    
    
    @IBOutlet var CheckItTwiceBorders: [UIImageView]!
    
    var allQuestions : [Question]!
    
    var questionIndex : Int!
    
    @IBOutlet weak var LeadButtonSelected: UIButton!
    
    @IBAction func LeadButtonTapped(_ sender: Any) {
        LeadButtonSelected.setImage(UIImage(named: "orange dot"), for: UIControlState.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var MainMenuSelected: UIButton!

//    @IBAction func MainMenuTapped(_ sender: UIButton) {
//        if isChecked == true {
//            UpDownArrow.image = UIImage(named: "checked box")
//            isChecked = false
//            
//        }
//        else {
//            if isChecked == nil {
//                isChecked = false
//            }
//            UpDownArrow.image = UIImage(named: "check list box (unfilled)")
//            isChecked = true
//        }
////        MainMenuSelected.setImage(UIImage(named: "fav heart"), for: UIControlState.normal)
////        MainMenuSelected.isSelected = false
//
//    }
    
    
    let questions = [
        Question(name: "Living, Dining, and Family Rooms", answers: ["If your home was built before 1978, check painted doors, windows, trim, and walls for lead", "Vacuum carpets regularly to reduce asthma triggers", "Move blind cords out of reach of children to prevent strangulation", "Check lighting and extension cords for fraying or bare wires", "Avoid having lighting and extension cords in floor pathways", "Purchase children’s toys that do not have small parts for choking and do not contain lead", "Secure heavy items (televisions, bookcases) to walls to prevent tip overs"]),
        Question(name: "Kitchen", answers: ["If your home was built before 1978, check painted doors, windows, trim, and walls for lead", "Use a range hood exhausted to the outside (or open window) to ventilate while cooking", "Clean up liquids and foods right after spills", "Keep matches, glassware, knives, and cleaning supplies out of reach of children", "Avoid leaving food and water out overnight", "Mop floors weekly", "Place Poison Control Hotline number (800) 222 – 1222 on the refrigerator and in every room", "Do not allow children to be in kitchen unsupervised when the range or oven is on"]),
        Question(name: "Bedroom(s)", answers: ["If your home was built before 1978, check painted doors, windows, trim, and walls for lead", "Move blind cords out of reach to prevent strangulation", "Make sure room has a working smoke detector", "Make sure the hall outside of bedrooms has a working carbon monoxide detector", "Use mattress and pillow covers, and vacuum carpets regularly to reduce asthma triggers"]),
        Question(name: "Entry", answers: ["Use floor mats by entry doors to reduce bringing in lead dust and other toxins into the home", "Remove shoes at entry if lead is present in the soil or paint", "Repair or install weather seals around the perimeter of doors"]),
        Question(name: "Bathrooms", answers: ["If your home was built before 1978, check painted doors, windows, trim, and walls for lead","Use an exhaust fan to ventilate after shower or bath use", "Use slip resistant mats in showers and tubs", "Clean up water from floors right after spills", "Keep medicines and cleaning supplies locked away and out of reach of children", "If an older adult or someone with mobility or balance concerns is present in the home, install grab bars at toilets, showers, and tubs"]),
        Question(name: "Laundry", answers: ["Vent clothes dryer to the outside (through roof or wall, not into the attic)", "Keep laundry soaps and detergents out of reach of children", "Wash sheets and blankets weekly to reduce asthma triggers", "Regularly remove lint from dryer screen"]),
        Question(name: "Attic", answers: ["Clean up clutter to prevent rodents and insects from finding places to nest", "Check exposed attic insulation for asbestos and consult with an asbestos professional for removal", "Make sure eave and roof vents are not blocked with insulation"]),
        Question(name: "Basement (or Crawlspace)", answers: ["If your home was built before 1978, check painted doors, windows, trim, and walls for lead", "Check if the pipe that connects your home to the water main (the service line) is made from lead", "Seal holes in walls and around windows and doors to keep rodents and pests out of living spaces", "Clean up clutter to prevent rodents and insects from finding places to nest", "Test the home for radon. If test shows radon above EPA recommended levels, seal slab and foundation wall cracks, and if the problem persists, consider installing a radon mitigation system", "Keep pesticides and cleaning supplies locked away and out of reach of children", "Seal all cracks in slabs and foundation walls for moisture, radon, and pest protection"]),
        Question(name: "Garage", answers: ["Never run lawnmowers, cars, or combustion equipment inside the garage with garage door closed", "Keep gasoline, pesticides, and cleaning supplies out of reach of children.", "Clean up oil, gasoline, and other spills immediately", "If a floor drain is present, make sure it drains to well beyond the outside of the home"]),
        Question(name: "Outside", answers: ["If your home was built before 1978, check painted doors, windows, trim, and walls for lead", "If your home was built before 1978, check painted doors, windows, trim, and walls for lead", "Remove leaves and debris from gutters regularly and extend downspouts to drain away from the house", "Replace missing or broken shingles or flashings", "Clean window wells of trash and debris", "Install and maintain fences completely around pools with openings less than 1/4 inch"]),
        Question(name: "Outside Continued", answers: ["If your home was built before 1978, check hardboard siding for asbestos", "Make sure private wells are sealed and capped.", "Consider testing your well for pesticides, organic chemicals, and heavy metals before you use it for the first time.", "Test private water supplies annually for nitrate and coliform bacteria to detect contaminations problems early", "Do not leave open garbage containers near the home", "Repair broken glass in windows and doors.", "Seal holes in walls and around windows and doors to keep rodents and pests out of living spaces"]),
        Question(name: "General", answers: ["If your home was built before 1978, use lead‐safe work practices for all renovation and repairs and test children in the home for lead exposure", "Check piping connecting your home to the water main and the piping in your home for lead (lead pipes are dull and can be scratched easily with a penny). Lead pipes are more likely to be found in homes built before 1986", "No smoking inside the home, especially with children in the same home", "Have a professional maintain yearly all gas appliances and check for carbon monoxide leaks and proper venting", "Do not use candles or incense in the home when adult supervision is not present", "Secure balcony and stair railings, and install no‐slip nosings"]),
        Question(name: "General Continued", answers: ["Replace burned‐out bulbs in lights over stairs and landings", "Run a dehumidifier if indoor humidity is above 50 percent or you see condensation on windows", "Make sure all gas burning appliances, furnaces, heaters, and fireplaces ventilate to the outside", "Replace the furnace filter with a MERV 8 or better every three months", "If mold is visible in any room, refer to mold removal guidelines from the EPA, CDC, or HUD", "Install child‐proof locks on cabinets and child‐proof covers on electrical outlets", "Keep water temperature at less than 120 degrees", "Keep firearms in locked safes", "Use pest management recommendations or safer alternative products before applying pesticides", "Keep all cleaning products in original containers and do not mix two products together"])
    ]
    
    var selectedQuestion = Question(name: "Living, Dining, and Family Rooms", answers: ["If your home was built before 1978, check painted doors, windows, trim, and walls for lead", "Vacuum carpets regularly to reduce asthma triggers", "Move blind cords out of reach of children to prevent strangulation", "Check lighting and extension cords for fraying or bare wires", "Avoid having lighting and extension cords in floor pathways", "Purchase children’s toys that do not have small parts for choking and do not contain lead", "Secure heavy items (televisions, bookcases) to walls to prevent tip overs"])
    
    var selectedIndex : Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let yourVC = segue.destination as? DetailViewController {
            yourVC.question = self.selectedQuestion
            yourVC.currentIndex = self.selectedIndex
            yourVC.allQuestions = self.questions
        }
    }

    @IBAction func familyHomesSelection(_ sender: Any) {
        HealthyHomesButton.forEach { (button) in
            button.isHidden = !button.isHidden
            button.contentHorizontalAlignment = .left
        }
        FamilyBorders.forEach { (border) in
            border.isHidden = !border.isHidden
        }
        FamilyImageView.forEach { (imageView) in
            imageView.isHidden = !imageView.isHidden
        }
        
    }
    
    @IBAction func BigStuffSelection(_ sender: Any) {
        BigStuffButton.forEach { (button) in
            button.isHidden = !button.isHidden
            button.contentHorizontalAlignment = .left
        }
        BigStuffImageView.forEach { (imageView) in
            imageView.isHidden = !imageView.isHidden
        }
        BigStuffBorders.forEach{ (border) in
            border.isHidden = !border.isHidden
        }
    }
    
    @IBAction func CheckItTwiceSelection(_ sender: Any) {
        CheckItTwiceButton.forEach { (button) in
            button.isHidden = !button.isHidden
            button.contentHorizontalAlignment = .left
        }
        CheckItTwiceBorders.forEach { (border) in
            border.isHidden = !border.isHidden
        }
        CheckItTwiceImageView.forEach { (imageView) in
            imageView.isHidden = !imageView.isHidden
        }
        
    }
    
    @IBOutlet var CheckItTwiceButtons: [UIButton]!
    
    @IBAction func CheckItTwiceButtons(_ sender: UIButton) {
        let title : String = sender.currentTitle!
        if (title == "1. Family Rooms"){
            self.selectedQuestion = questions[0]
            selectedIndex = 0
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "2. Kitchen") {
            self.selectedQuestion = questions[1]
            selectedIndex = 1
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "3. Bedroom") {
            self.selectedQuestion = questions[2]
            selectedIndex = 2
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "4. Entry") {
            self.selectedQuestion = questions[3]
            selectedIndex = 3
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "5. Bathroom") {
            self.selectedQuestion = questions[4]
            selectedIndex = 4
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "6. Laundry") {
            self.selectedQuestion = questions[5]
            selectedIndex = 5
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "7. Attic") {
            self.selectedQuestion = questions[6]
            selectedIndex = 6
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "8. Basement") {
            self.selectedQuestion = questions[7]
            selectedIndex = 7
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "9. Garage") {
            self.selectedQuestion = questions[8]
            selectedIndex = 8
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "10. Outside") {
            self.selectedQuestion = questions[9]
            selectedIndex = 9
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        } else if (title == "11. General") {
            self.selectedQuestion = questions[11]
            selectedIndex = 11
            self.performSegue(withIdentifier: "ChecklistSideMenu", sender: self)
        }
    }
    
    @IBAction func keepItDryTouched(_ sender: UIButton) {
        let mainStoreboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "keepItDryViewController") as! keepItDryViewController
        self.navigationController?.pushViewController(DVC, animated: true)
    }
}
