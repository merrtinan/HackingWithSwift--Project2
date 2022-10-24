
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["us", "uk", "france", "nigeria", "spain", "estonia", "poland", "russia", "germany", "ireland", "monaco"]

        askQuestion(action: nil)
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor


    }
    func askQuestion(action: UIAlertAction!) {
    
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: UIControl.State.normal)
        button2.setImage(UIImage(named: countries[1]), for: UIControl.State.normal)
        button3.setImage(UIImage(named: countries[2]), for: UIControl.State.normal)
        
        let uppercasedCountry = countries[correctAnswer].uppercased()
        title = "Score: \(score) - tap on : \(uppercasedCountry) s flag"
        

    }
    
    @IBAction func buttonTapped1(_ sender: UIButton) {
        var title : String
        
        if sender.tag ==  correctAnswer {
            title = "Correct"
            score += 1
            let ac = UIAlertController(title: title, message: "Your score is: \(score)", preferredStyle: UIAlertController.Style.alert)
            ac.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            title = "Wrong"
            score -= 1
            let ac2 = UIAlertController(title: title, message: "Wrong flag!, this flag is : \(countries[sender.tag].uppercased())s flag", preferredStyle: UIAlertController.Style.alert)
            ac2.addAction(UIAlertAction(title: "Countinue", style: UIAlertAction.Style.default, handler: askQuestion))
            present(ac2, animated: true)
        }
        if score == 10 {
            let ac3 = UIAlertController(title: "Your score is 10", message: "You reached 10 score", preferredStyle: UIAlertController.Style.alert)
            ac3.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: askQuestion))
            present(ac3, animated: true)
        }
    }
    
    }

