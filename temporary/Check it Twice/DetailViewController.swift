import UIKit
import MessageUI
import Foundation

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate, UITextViewDelegate {
    
    // Declaration of UI objects.
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var ChecklistTextBox : UITextView!

    var answers : [String]!
    var rowChecked = false
    var extraNotes : String!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var MainMenu: UIButton!
    @IBOutlet weak var MailButton: UIButton!
    
    // When ever the mail button is tapped the pdf generated is sent to email.
    @IBAction func MailButtonTapped(_ sender: UIButton) {
        convertToPDF()
    }
    
    // refreshes UI when ever it loads.
    var question: Question? {
        didSet {
            refreshUI()
        }
    }

    var currentIndex : Int? {
        didSet {
            refreshUI()
        }
    }
    var allQuestions : [Question]? {
        didSet {
            refreshUI()
        }
    }
    
    @IBOutlet var BottomNavButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answersTableView.tableFooterView = UIView()
        self.answersTableView.delegate = self
        self.answersTableView.dataSource = self
        self.ChecklistTextBox.delegate = self
        self.answersTableView.separatorColor = UIColor.clear
        self.answersTableView.tableFooterView = UIView()
        self.answersTableView.backgroundColor = #colorLiteral(red: 1, green: 0.9345881343, blue: 0.1666745543, alpha: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.keyboardWillShow(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        // fixing title font for iPhone screens to 15 and iPad screens to 27
        let frame = UIScreen.main.bounds
        
        for button in BottomNavButtons {
            if frame.height > 850 && frame.width > 450  {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
                button.titleLabel?.textAlignment = .center
            }
            else
            {
                button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
                button.titleLabel?.textAlignment = .center
            }
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = question?.name
        answers = (question?.answers)!
        self.answersTableView.reloadData()
        let notesKey = "Mynotes|" + (self.question?.name)!
        ChecklistTextBox.text = UserDefaults.standard.object(forKey: notesKey) as? String
    }
    
    var questionIndex = 0
    
    // When ever the next button is clicked, it decreases the question number and loads the screen with that checklist options.
    @IBAction func backChecklistButton(_ sender: UIButton) {
        self.currentIndex = (self.currentIndex!-1)

        if currentIndex! == -1 {
            currentIndex = 12
        }
        self.question = allQuestions?[currentIndex!]
        refreshUI()
    }
    
    // When ever the next button is clicked, it increases the question number and loads the screen with that checklist options.
    @IBAction func nextChecklistButton(_ sender: UIButton) {
        self.currentIndex=self.currentIndex!+1
        if currentIndex! == (allQuestions?.count)! {
            currentIndex = 0
        }
        self.question = allQuestions?[currentIndex!]
        refreshUI()
    }
    
    func numberOfSections(in answersTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ answersTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count 
    }
    
    func tableView(_ answersTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answersTableView.dequeueReusableCell(withIdentifier: "possibleAnswer", for: indexPath) as! ChecklistTableViewCell
        let defaults = UserDefaults.standard
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.answerLabel.text = answers[indexPath.row]
        cell.answerLabel.numberOfLines = 0
        cell.answerLabel.layer.masksToBounds = true
        cell.answerLabel.layer.cornerRadius = 5
        configureCheckmark(for: cell, at: indexPath)
        
        // fixing title font for iPhone screens to 13 and iPad screens to 27
        let frame = UIScreen.main.bounds
        
        if frame.height > 850 && frame.width > 450  {
            cell.answerLabel.font = UIFont(name: "Helvetica Neue", size: 25)
        }
        else
        {
            cell.answerLabel.font = UIFont(name: "Helvetica Neue", size: 13)
        }
        
        let optionIndex = indexPath.row
        let key = "checklist|" + (self.question?.name)! + "|" + (self.question?.answers[optionIndex])! + "|" + String(optionIndex)
        
         // Stores the bookmark status in userdefaults.
        let existingAnswer = defaults.object(forKey:key) as? Bool
        if (existingAnswer == true) {
            cell.checkBox.image = UIImage(named: "checked box")
        } else{
            if (existingAnswer == nil){
                UserDefaults.standard.set(false, forKey: key)
                UserDefaults.standard.synchronize()
            }
            cell.checkBox.image = UIImage(named: "check list box (unfilled)")
        }
        
        return cell;
    }
   
    func tableView(_ answersTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = answersTableView.cellForRow(at: indexPath) {
            
            let checkBox = cell.viewWithTag(3) as! UIImageView
            var isChecked = false
            
            rowChecked = !rowChecked
            isChecked = rowChecked
            
            if isChecked {
                checkBox.image = UIImage(named: "checked box")
            } else {
                checkBox.image = UIImage(named: "check list box (unfilled)")
            }
        }
        
        // if the checklist option is clicked it alters the status of existing answer.
        let key = "checklist|" + (self.question?.name)! + "|" + (self.question?.answers[indexPath.row])! + "|" + String(indexPath.row)
        var existingAnswer = UserDefaults.standard.object(forKey:key) as? Bool
        if (existingAnswer == nil){
            existingAnswer = false
        }
        UserDefaults.standard.set(!existingAnswer!, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    // Based on the status of existing answer, the checklist option image updates.
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        let checkBox = cell.viewWithTag(3) as! UIImageView
        var isChecked = false        
        isChecked = rowChecked
        
        if isChecked {
            checkBox.image = UIImage(named: "checked box")
        } else {
            checkBox.image = UIImage(named: "check list box (unfilled)")
        }
    }
    
    // when ever the textfield appears, view goes up for 150 points.
    @objc func keyboardWillShow(notification: Notification) {
        self.view.frame.origin.y = -150
    }
    
     // when ever the textfield disappears, view comes to normal position.
    @objc func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    func textView(_ ChecklistTextBox: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            ChecklistTextBox.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ ChecklistTextBox: UITextView) {
        let notesKey = "Mynotes|" + (self.question?.name)!
        // get users answer
        // save that in nsuserdefaultss
        UserDefaults.standard.set(ChecklistTextBox.text, forKey: notesKey)
        UserDefaults.standard.synchronize()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // using the html script, the checklist pages are added into a pdf and will be mailed to email in the form of pdf.
    func convertToPDF() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self;
            // mail.setCcRecipients(["yyyy@xxx.com"])
            mail.setSubject("Healthy Homes Youth Checklist")
            mail.setMessageBody("PFA", isHTML: false)
            
            var checklistData : String = "<br><a ``=\"www.healthyhomespartnership.net\" style=\"font-size: 13px;\"><div align=\"center\">www.healthyhomespartnership.net</a>"
            checklistData  += "<a href=\"www.extensionhealthyhomes.org\" style=\"font-size: 13px;\">,&nbspwww.extensionhealthyhomes.org</a>"
            checklistData  += "<a href=\"www.hud.gov/healthyhomes\" style=\"font-size: 13px;\">,&nbspwww.hud.gov/healthyhomes</div></a>"
            checklistData += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<h2 align=\"center\">Healthy Homes Partners Checklist</h2><br><br>"
            let keys = UserDefaults.standard.dictionaryRepresentation().keys
            var chapterNames = [String]()
            var checkListArray = [[String]]()
            var notesAnswers = [String]()
            
            for key in keys
            {
                if key.contains("checklist|"){
                    var value = UserDefaults.standard.value(forKey: key) as! Bool
                    var checklistDataOptions = key.components(separatedBy: "|") as [String]
                    let chapter_name = checklistDataOptions[1]
                    var option_name = checklistDataOptions[2]
                    
                    if(value == true)
                    {
                        option_name = "<input type=\"checkbox\"  width=8px checked >&nbsp" + option_name                        
                    }
                    else {
                        option_name =  "<input type=\"checkbox\" width=8px>&nbsp" + option_name
                    }
                    
                    let chapterIndex = chapterNames.index(of: chapter_name)
                    if chapterIndex != nil{
                        checkListArray[chapterIndex!].append(option_name)
                    }
                    else {
                        chapterNames.append(chapter_name)
                        var columnArray = [String]()
                        columnArray.append(option_name)
                        checkListArray.append(columnArray)
                    }
                }
                // if key contains notes add to notes answers array add its html content
                if key.contains("Mynotes|") {
                    //get the answer and put its html into array
                    var notes_content = UserDefaults.standard.value(forKey: key) as! String
                    var notesDataOptions = key.components(separatedBy: "|") as [String]
                    notesAnswers.append(notes_content)
                }
            }
            
            for index in 0..<chapterNames.count
            {
                checklistData = checklistData + "<b><i>Chapter : \(chapterNames[index])</i></b>" + "<br>"
                for option in checkListArray[index]
                {
                    checklistData = checklistData + option + "<br>"
                }
                checklistData = checklistData + notesAnswers[index] + "<br>"
                checklistData = checklistData + "<br><br>"
            }
            
            let fmt = UIMarkupTextPrintFormatter(markupText: checklistData)
            
            // 2. Assign print formatter to UIPrintPageRenderer
            
            let render = UIPrintPageRenderer()
            render.addPrintFormatter(fmt, startingAtPageAt: 0)
            
            // 3. Assign paperRect and printableRect
            
            let page = CGRect(x: 10, y: 10, width: 605.2, height: 750) // A4, 72 dpi
            let printable = page.insetBy(dx: 20, dy: 100)
            
            render.setValue(NSValue(cgRect: page), forKey: "paperRect")
            render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
            
            // 4. Create PDF context and draw
            
            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero,nil)
            
            for i in 1...render.numberOfPages {
                
                UIGraphicsBeginPDFPage();
                
                if (i == 1)
                {
                    // Draw image on top of page
                    var image = UIImage(named: "Group 2701")
                    image?.draw(in: CGRect(x: 60, y: 21, width: 80,height: 80))
                    image = UIImage(named: "Group 2702")
                    image?.draw(in: CGRect(x: 160, y: 21, width: 80,height: 80)) //190
                    image = UIImage(named: "healthy homes logo")
                    image?.draw(in: CGRect(x: 255, y: 21, width: 210,height: 90))
                    image = UIImage(named: "Group 2700")
                    image?.draw(in: CGRect(x: 480, y: 21, width: 80,height: 80))
                }
                // page number on right
                let pageNumberString: NSString = "\(i)" as NSString
                pageNumberString.draw(with: CGRect(x: 302, y: 750, width: 10,height: 12), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: nil,context: nil)
                let bounds = UIGraphicsGetPDFContextBounds()
                render.drawPage(at: i - 1, in: bounds)
            }
            UIGraphicsEndPDFContext();
            
            let file = "check.txt" //Temporary file to write data
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let path = dir.appendingPathComponent(file)
                //writing
                try pdfData.write(to: path, atomically: true) // -----uncomment later
                let filePath = path.path
                if FileManager.default.fileExists(atPath: filePath) {
                    if let fileData = FileManager.default.contents(atPath: filePath) {
                        //Does not print. Nil?
                        print("File data loaded.")
                        mail.addAttachmentData(fileData as Data, mimeType: "application/pdf", fileName: "Healthy Homes Youth Checklist.pdf")
                    }
                }
                self.present(mail, animated: true, completion: nil)
            }
        }
        else {
            self.showSendMailErrorAlert()
        }
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
}

extension DetailViewController: MonsterSelectionDelegate {
    func monsterSelected(_ newMonster: Question) {
        question = newMonster
    }
}

extension DetailViewController: ChecklistSelectionDelegate {
    func checklistSelected(_ newMonster: Question) {
        question = newMonster
    }
}


