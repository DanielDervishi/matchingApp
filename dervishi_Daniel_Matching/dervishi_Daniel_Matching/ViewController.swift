import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblCountDown: UILabel!
    @IBOutlet weak var LblScorePlayer1: UILabel!
    @IBOutlet var btnCollection: [UIButton]!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var LblScorePlayer2: UILabel!
    @IBOutlet weak var giveUpButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
  
    
    var delay = 0.0
var theThing: [UIImage] = [#imageLiteral(resourceName: "cycling"),#imageLiteral(resourceName: "cycling"),#imageLiteral(resourceName: "abseiling"),#imageLiteral(resourceName: "abseiling"), #imageLiteral(resourceName: "volleyball-player-motion") , #imageLiteral(resourceName: "volleyball-player-motion") ,#imageLiteral(resourceName: "river-rafting"),#imageLiteral(resourceName: "river-rafting"),#imageLiteral(resourceName: "throwing-javelin"),#imageLiteral(resourceName: "throwing-javelin"),#imageLiteral(resourceName: "tennis-player-with-racket (1)"),#imageLiteral(resourceName: "tennis-player-with-racket (1)"),#imageLiteral(resourceName: "weight-lifting"),#imageLiteral(resourceName: "weight-lifting"),#imageLiteral(resourceName: "skateboarder"),#imageLiteral(resourceName: "skateboarder")]
var intArray: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
var myTimer = Timer()
var myTime:Int = 60
        func thetimer(){
            myTime -= 1
            lblCountDown.text = "Time Left: \(myTime)"
        }
    override func viewDidLoad() {
        super.viewDidLoad()

//        theThing.shuffle()
        lblCountDown.isHidden = true
        LblScorePlayer1.isHidden = true
        LblScorePlayer2.text = ""
        for index in btnCollection{
            index.isHidden = true
        }
        giveUpButton.isHidden = true
        newGameButton.isHidden = true

    }

//Reset Function
    func reset(){
        seconds = 60
        gameMode = 1
        bothFlipped = 0
        btnThingy = 0
        exponential = 0
        scorePlayer1 = 0
        matches = 0
    }
var turn = 0
var player1Name = "Player 1"
var player2Name = "Player 2"
var seconds = 60
var gameMode = 1
var bothFlipped = 0
var btnThingy = 0
var exponential = 0
var scorePlayer1 = 0
var scorePlayer2 = 0
var matches = 0
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func btnCollectionPressed(_ sender: UIButton) {
 
bothFlipped += 1
if bothFlipped == 1{
    sender.setImage(theThing[sender.tag - 1], for: .normal)
    Animations.simple(vc: self, speed: 0.5, button: sender)
    btnThingy = sender.tag - 1
    sender.isEnabled = false
}else if bothFlipped == 2{
    sender.isEnabled = false
        for index in intArray{
            btnCollection[index].isEnabled = false
        }
    sender.setImage(theThing[sender.tag - 1], for: .normal)
    Animations.simple(vc: self, speed: 0.5, button: sender)
    bothFlipped = 0
        for index in intArray{
            btnCollection[index].isEnabled = false
        }
if sender.image(for: .normal) == btnCollection[btnThingy].image(for: .normal){
    
    matches += 1
    sender.isEnabled = false
    btnCollection[btnThingy].isEnabled = false

    btnCollection[sender.tag - 1].isEnabled = false
    btnCollection[btnThingy].isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            for index in self.intArray{
                    self.btnCollection[index].isEnabled = true
            }
if self.matches == 8{
        self.myTimer.invalidate()
            for index in self.btnCollection{
                index.isEnabled = false
            }
        Alerts.showActionAlertWithOkayAndCancel(on: self, with: "Game Over", message: "The winner score is \(self.scorePlayer1)", okayAction: { _ in
            for index1 in self.btnCollection.reversed(){
                self.delay += 0.15
                DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {

                    index1.setImage(self.theThing[index1.tag - 1], for: .normal)
                    Animations.individualLast(vc: self, speed: 0.9, button: index1)
        }
                
    }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.newGameButton.sendActions(for: .touchUpInside)
            }
        }) { _ in
    //Put Code Here
        }
    self.delay = 0
    }
                }
    intArray =  intArray.filter {$0 != btnThingy}
    intArray = intArray.filter {$0 != sender.tag - 1}
    if turn == 1{
    scorePlayer2 += Int(pow(2, Double(exponential)))
    }else if turn == 0{
    scorePlayer1 += Int(pow(2, Double(exponential)))
    }
    exponential += 1
}else{
    if turn == 1 && gameMode == 2{
        turn = 0
    }else if turn == 0 && gameMode == 2{
        turn = 1
    }
    
    exponential = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            sender.setImage(#imageLiteral(resourceName: "baraam"), for: .normal)
            Animations.simple(vc: self, speed: 0.5, button: sender)
            self.btnCollection[self.btnThingy].setImage(#imageLiteral(resourceName: "baraam"), for: .normal)
            Animations.simple(vc: self, speed: 0.5, button: self.btnCollection[self.btnThingy])
                for index in self.intArray{
                    self.btnCollection[index].isEnabled = true
                }
        }
        }
    }
    LblScorePlayer1.text = "\(player1Name) Score: \(scorePlayer1)"
    if gameMode == 2{
    LblScorePlayer2.text = "\(player2Name) Score: \(scorePlayer2)"
        }
       if turn == 0 && gameMode == 2{
    lblCountDown.text = "\(player1Name)'s turn"
        }else if turn == 1  && gameMode == 2{
    lblCountDown.text = "\(player2Name)'s turn"
        }
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
        }
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
LblScorePlayer1.isHidden = false
lblCountDown.isHidden = false

for index2 in btnCollection{
index2.isEnabled = false
}
for index in 0...15{
    delay += 0.15
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.btnCollection[index].setImage(#imageLiteral(resourceName: "baraam"), for: .normal)
            Animations.individual(vc: self, speed: 0.9, button: self.btnCollection[index])

            }
    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
        for index2 in self.btnCollection{
    index2.isEnabled = true
        }
    self.giveUpButton.isHidden = false
    self.newGameButton.isHidden = false
    }
        }
delay = 0
startGameButton.isHidden = true
    for index in btnCollection{
        index.isHidden = false
    }

if gameMode == 0{
lblCountDown.text = ""
//player1Name = Alerts.showWithTextField(on: self, with: "Title", message: "Enter your name", actionTitle: "Done", textFieldPlaceholder: "Enter a name")
}else if gameMode == 1{
lblCountDown.text = "Time Left: 60"
//self.player1Name = Alerts.showWithTextField(on: self, with: "Message", message: "Enter player 1's name", actionTitle: "Done", textFieldPlaceholder: "Name")

//self.player2Name = Alerts.showWithTextField(on: self, with: "Message", message: "Enter player 2's name", actionTitle: "Done", textFieldPlaceholder: "Name")
                
DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
self.myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in self.thetimer()
if self.myTime == 0{
    self.myTimer.invalidate()
        for index in self.btnCollection{
            index.isEnabled = false
        }
Alerts.showActionAlertWithOkayAndCancel(on: self, with: "Game Over", message: "Sorry you lost", okayAction: { _ in
    for index1 in self.btnCollection.reversed(){
        self.delay += 0.15
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                index1.setImage(self.theThing[index1.tag - 1], for: .normal)
                Animations.individualLast(vc: self, speed: 0.9, button: index1)
}
}
}) { _ in
//Put Code Here
}
}
})
}
}else if gameMode == 2{
    lblCountDown.text = ""

        }
        //        if gameMode == 2{
                    LblScorePlayer1.text = "\(player1Name) Score: \(scorePlayer1)"


                    LblScorePlayer2.text = "\(player2Name) Score: \(scorePlayer2)"
                        
                       if turn == 0 && gameMode == 2{
                    lblCountDown.text = "\(player1Name)'s turn"
                        }else if turn == 1  && gameMode == 2{
                    lblCountDown.text = "\(player2Name)'s turn"
                        }
        //        }
}

    @IBAction func giveUpButtonPressed(_ sender: UIButton) {
        giveUpButton.isEnabled = false
            for index1 in self.btnCollection.reversed(){
                self.delay += 0.15
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                        if index1.image(for: .normal) != #imageLiteral(resourceName: "baraam"){
                            
                        }else{
                            
                        
                        index1.setImage(self.theThing[index1.tag - 1], for: .normal)
                        Animations.individualLast(vc: self, speed: 0.9, button: index1)
        }
                }
        }
        myTimer.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {


    }
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
//        self.dismiss(animated: false, completion: nil)
//        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}
