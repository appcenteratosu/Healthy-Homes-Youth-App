
import UIKit

class quizScreenViewController: UIViewController {
    
    @IBOutlet weak var chapterName: UILabel!
    @IBOutlet weak var quesName: UILabel!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var percent: Double = 0.0
    var StatusArray = [String]()
    var status = String()
    
    //outlet for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var nextButtonSelected: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var backButtonSelected: UIButton!    
    @IBOutlet weak var endQuiz: UIButton!
    
    // Unwind Segues.
    @IBAction func returnToQuizScreen (segue: UIStoryboardSegue) {
        
    }
    
    // When ever the next button is clicked, it decreases the question number and loads the screen with that checklist options.
    @IBAction func backButton(_ sender: UIButton) {
        if questionNumber > 0 {
            if sender.tag == 5 {
                questionNumber -= 1
                updateQuestion()
            }
        }
    }
    
    // When ever the next button is clicked, it increases the question number and loads the screen with that checklist options.
    @IBAction func nextButton(_ sender: UIButton) {
        if status == "correct" {
            score += 1
        }
        percent = Double(score*4)

        if questionNumber == 24 {
            nextButtonSelected.isHidden = true
        }
        self.StatusArray[questionNumber] = status
        
        if sender.tag == 6 {
            questionNumber += 1
            updateQuestion()
        }
    }
    
    // When the quiz ends it leads to quiz results page.
    @IBAction func EndQuiz(_ sender: Any) {
        self.performSegue(withIdentifier: "results", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fixing title font for iPhone screens to 14 and iPad screens to 30.
        let frame = UIScreen.main.bounds
        
        if frame.height > 850 && frame.width > 450  {
            nextButtonSelected.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 30)
            chapterName.font = UIFont(name: "Helvetica Neue", size: 30)
            chapterName.font = UIFont.boldSystemFont(ofSize: 30)
            quesName.font = UIFont(name: "Helvetica Neue", size: 25)
            optionA.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
            optionB.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
            optionC.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
            optionD.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 25)
        }
        else
        {
            nextButtonSelected.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            chapterName.font = UIFont(name: "Helvetica Neue", size: 14)
            chapterName.font = UIFont.boldSystemFont(ofSize: 14)
            quesName.font = UIFont(name: "Helvetica Neue", size: 14)
            optionA.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            optionB.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            optionC.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
            optionD.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
        
        // fixing title font for iPhone screens to 15 and iPad screens to 27.
        if frame.height > 850 && frame.width > 450  {
            backButtonSelected.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            backButtonSelected.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
        
        if frame.height > 850 && frame.width > 450  {
            endQuiz.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
        }
        else
        {
            endQuiz.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        }
        
        quesName.adjustsFontSizeToFitWidth = false
        
        //you should update answer here only if he hasnt clicked
        StatusArray = ["skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped",
        "skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped",
        "skipped","skipped","skipped","skipped","skipped","skipped","skipped","skipped"]
      
        updateQuestion()
        
        backgroundView.layer.cornerRadius = 5;
        backgroundView.layer.masksToBounds = true;
        
        backButtonSelected.titleLabel?.textAlignment = .center
        backButtonSelected.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        backButtonSelected.titleLabel?.adjustsFontSizeToFitWidth = true
        backButtonSelected.layer.cornerRadius = 5
        
        nextButtonSelected.titleLabel?.textAlignment = .center
        nextButtonSelected.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        nextButtonSelected.titleLabel?.adjustsFontSizeToFitWidth = true
        nextButtonSelected.layer.cornerRadius = 5
        
        endQuiz.titleLabel?.adjustsFontSizeToFitWidth = true
        backButtonSelected.layer.cornerRadius = 5
        
        endQuiz.titleLabel?.textAlignment = .center
        nextButtonSelected.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        endQuiz.titleLabel?.adjustsFontSizeToFitWidth = true
        endQuiz.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When ever option A is clicked, it changes the button image and updates status value upon checking with correct answer value.
    @IBAction func optionAPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
     // When ever option B is clicked, it changes the button image and updates status value upon checking with correct answer value.
    @IBAction func optionBPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
     // When ever option C is clicked, it changes the button image and updates status value upon checking with correct answer value.
    @IBAction func optionCPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
     // When ever option D is clicked, it changes the button image and updates status value upon checking with correct answer value.
    @IBAction func optionDPressed(_ sender: UIButton) {
        if(sender.backgroundImage(for: UIControlState.normal) == UIImage(named: "unselected button")  ) {
            sender.setBackgroundImage(UIImage(named: "selected answer button"), for: UIControlState.normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        }
        optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
            optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
        } else {
            optionC.setBackgroundImage(nil, for: UIControlState.normal)
            optionD.setBackgroundImage(nil, for: UIControlState.normal)
        }
        
        if sender.tag == selectedAnswer {
            status = "correct"
        } else {
            status = "wrong"
        }
         print(status)
    }
    
    var percentage = Int()
    
    // send the status, and score of the quiz to quiz results screen.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results" {
            if let vc = segue.destination as? QuizResultsViewController {
                vc.scoreText = self.score
                vc.percentage = self.percent
                vc.answerStatusArray = self.StatusArray
            }
        }
    }
    
    // When ever the next question of prev question is called this updates the options, chapter title and question title corresponding to the value of question.
    func updateQuestion() {
        if questionNumber <= allQuestions.list.count {
            optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            
            if optionC.title(for: UIControlState.normal) != "" {
                optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionC.setBackgroundImage(nil, for: UIControlState.normal)
            }
            
            if optionD.title(for: UIControlState.normal) != "" {
                optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionD.setBackgroundImage(nil, for: UIControlState.normal)
            }
        }
        
        if questionNumber <= allQuestions.list.count - 1 {
            chapterName.text = allQuestions.list[questionNumber].chapterName
            quesName.text = allQuestions.list[questionNumber].questionName
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControlState.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControlState.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControlState.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControlState.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAns
            
            if optionC.title(for: UIControlState.normal) != "" && optionD.title(for: UIControlState.normal) != "" {
                optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
                optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionC.setBackgroundImage(nil, for: UIControlState.normal)
                optionD.setBackgroundImage(nil, for: UIControlState.normal)
            }
        }
        status = "skipped"
        
    }
    
    var Score : Int = 0

    // if try again option is clicked then the score and question number returns to 0.
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
}
