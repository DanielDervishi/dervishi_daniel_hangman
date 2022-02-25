import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet var btnCollection: [UIButton]!
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var lblWord: UILabel!
    @IBOutlet weak var hangmanImageView: UIImageView!
    
    
    var word = ""
    var wordHidden = ""
    var alert = UIAlertController(title: "New Game", message: "Insert the desired word and press ok to begin the game.", preferredStyle: .alert)
    var losses = 0
    var imageArray: [UIImage] = [UIImage(named: "Hangman1")!,UIImage(named: "Hangman2")!,UIImage(named: "Hangman3")!,UIImage(named: "Hangman4")!,UIImage(named: "Hangman5")!,UIImage(named: "Hangman6")!,UIImage(named: "Hangman7")!]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   createTextAlert()
        giveTags()
        hangmanImageView.image = imageArray[0]
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target:self , action: #selector(dismissKeyboard))
        view.addGestureRecognizer(Tap)
        self.dismissKeyboard()
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    override func viewDidAppear(_ animated: Bool) {
                self.present(self.alert, animated: true, completion: nil)
    }

    @IBAction func btnCollectionPressed(_ sender: UIButton) {

        checkLetter(senderTag: sender.tag)
        checkForWinOrLoss()
    }
    
    
    
    
    
    
    
    
    
    func createTextAlert (){
         alert.addTextField(configurationHandler: { (textField) -> Void in
    
                textField.placeholder = "Enter Word"
            })
    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (action) -> Void in
    
                self.word = (alert?.textFields![0].text)!.uppercased()
                if self.word.count > 10{
                    alert?.title = "Caution!"
                    alert?.message = "Be sure to keep the word under 10 characters"
                    self.present(self.alert, animated: true, completion: nil)
                }else if self.word.count < 1{
                    alert?.title = "Caution!"
                    alert?.message = "Be sure to enter a word"
                    self.present(self.alert, animated: true, completion: nil)
                }else{
                for _ in self.word{
                    self.wordHidden += "_"
                }

                self.wordHidden = self.wordHidden.separate(every: 1, with: " ")
                self.word = self.word.separate(every: 1, with: " ")
                
                self.wordHidden = self.takeCareOfSpaces()
                self.lblWord.text = self.wordHidden
                    Animation.withLabel(label: self.lblWord, scale: 1.7)
                print(self.word)
                print(self.wordHidden)
                }
                alert?.textFields![0].text = ""
            }))
        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: { [weak alert] (action) -> Void in
            
            self.backButton.pressProgramically()
            }))
    }
    func takeCareOfSpaces () -> String{
        let wordArray: [Character] = Array(word)
    var wordArrayHidden: [Character] = Array(wordHidden)
        var stringArray:[String] = []
        for index in 0...wordArray.count - 1{
            if index == 0{
                continue
            }else if wordArray[index] == " " && wordArray[index - 1] == " "{
                wordArrayHidden[index] = " "
            }
        }
        stringArray = wordArrayHidden.map{ String($0)}
        return stringArray.joined()
    }

    func giveTags (){
var counter = 0
        for index in btnCollection{
            index.tag = counter
            counter += 1
        }
    }
    func checkLetter(senderTag: Int) {
        let wordArray: [Character] = Array(word)
        var wordArrayHidden: [Character] = Array(wordHidden)
        let letter: Character = Character(btnCollection[senderTag].currentTitle!)
        if wordArray.contains(letter){
            for index in 0...wordArray.count - 1{
                if letter == wordArray[index]{
                    wordArrayHidden[index] = wordArray[index]
                }
            }
            wordHidden = wordArrayHidden.map{ String($0)}.joined()
            btnCollection[senderTag].isEnabled = false
            lblWord.text = wordHidden
            Animation.withLabel(label: self.lblWord, scale: 1.7)

        }else{
           losses += 1
            btnCollection[senderTag].isEnabled = false
            Animation.normal(image: imageArray[losses], speed: 0.2, imageView: hangmanImageView, transition: .transitionCrossDissolve)
            UIView.animate(withDuration: 2.0) {
                let translateTransform = CGAffineTransform(translationX: 0, y: 500)
                self.btnCollection[senderTag].transform = translateTransform
            }
    }
    }
    func checkForWinOrLoss(){
        if !wordHidden.contains("_"){
            Alerts.showActionAlertWithOkayAndReset(on: self, with: "Game Over", message: "Congratulations your hangman survived! You may reset the game below") { _ in
                self.reset()
            }
        }else if losses == 6{
            //Add what is needed to the end of the game
    btnCollection.disableAllUserEnabled(array: btnCollection)
            Alerts.showActionAlertWithOkayAndReset(on: self, with: "Game Over", message: "Unfortunately your hangman has died. You may reset the game") { _ in
                self.reset()
            }
        }
    }
    func reset(){
        for index1 in btnCollection{
            if index1.isEnabled == false{
        UIView.animate(withDuration: 2.0) {
            let translateTransform = CGAffineTransform(translationX: 0, y: 0)
            index1.transform = translateTransform
        }
            }
        }
        btnCollection.enableAll(array: btnCollection)
        btnCollection.enableAllUserEnabled(array: btnCollection)
        losses = 0
        word = ""
        wordHidden = ""
        hangmanImageView.image = imageArray[0]
        alert.message = "Insert the desired word and press ok to begin the game."
        alert.title = "New Game"
    self.present(self.alert, animated: true, completion: nil)
    }
    @IBAction func restartGame(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
    
}

