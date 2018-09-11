
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
    
    @IBAction func returnToQuizScreen (segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if questionNumber > 0 {
            if sender.tag == 5 {
                questionNumber -= 1
                updateQuestion()
            }
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if status == "correct" {
            score += 1
        }
        percent = Double(score*4)
        print(status)
         print(score)
   //     StatusArray.append(status)
        if questionNumber == 24 {
            nextButtonSelected.isHidden = true
        }
        self.StatusArray[questionNumber] = status
        
        if sender.tag == 6 {
            questionNumber += 1
            updateQuestion()
        }
    }
    
    
    @IBAction func EndQuiz(_ sender: Any) {
        self.performSegue(withIdentifier: "results", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = UIScreen.main.bounds
        
        if frame.height > 850 && frame.width > 450  {
            nextButtonSelected.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 27)
            chapterName.font = UIFont(name: "Helvetica Neue", size: 27)
            chapterName.font = UIFont.boldSystemFont(ofSize: 27)
            quesName.font = UIFont(name: "Helvetica Neue", size: 22)
            optionA.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 24)
            optionB.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 24)
            optionC.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 24)
            optionD.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 24)
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
        updateUI()
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results" {
            if let vc = segue.destination as? QuizResultsViewController {
                vc.scoreText = self.score
                vc.percentage = self.percent
                vc.answerStatusArray = self.StatusArray
            }
        }
        
    }
    
    func updateQuestion() {
        if questionNumber <= allQuestions.list.count {
            optionA.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            optionB.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            
            if optionC.title(for: UIControlState.normal) != "" {
                optionC.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionC.setBackgroundImage(nil, for: UIControlState.normal)
                //            optionC.backgroundColor = UIColor.clear
                //            optionC.isHidden = true
            }
            
            if optionD.title(for: UIControlState.normal) != "" {
                optionD.setBackgroundImage(UIImage(named: "unselected button"), for: UIControlState.normal)
            } else {
                optionD.setBackgroundImage(nil, for: UIControlState.normal)
                //            optionC.backgroundColor = UIColor.clear
                //         optionD.isHidden = true
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
    
    func updateUI() {
        
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
}
