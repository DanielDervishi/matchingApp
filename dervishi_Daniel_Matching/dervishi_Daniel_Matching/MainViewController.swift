import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var player1NameTxt: UITextField!
    @IBOutlet weak var player2NameTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func unwindToVC1(unwindSegue:UIStoryboardSegue) {
        
    }
    
    var player1Name = ""
    var player2Name = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender! as AnyObject).currentTitle == "Button" {
        } else if (sender! as AnyObject).currentTitle == "LeaderBoard"{
            
        }
        
        
        
        else{
                   let myVC = segue.destination as! ViewController

                   myVC.gameMode = gamemode
                   myVC.player1Name = player1Name
                   myVC.player2Name = player2Name
               }


    }
//  func prepare(for segue: UIStoryboardSegue, sender: UIButton) {
//        if sender.currentTitle == "Button" {
//            print("do nothing")
//        } else {
//            let myVC = segue.destination as! ViewController
//
//            myVC.gameMode = gamemode
//            myVC.player1Name = player1Name
//            myVC.player2Name = player2Name
//        }
//
//
//    }

    
    var gamemode = 0
    @IBAction func singlePlayer(_ sender: UIButton) {
//Change
gamemode = 0
performSegue(withIdentifier: "mainSegue", sender: self)

        
    }
    @IBAction func Player(_ sender: UIButton) {
gamemode = 2
        player2Name = player2NameTxt.text!
        player1Name = player1NameTxt.text!
        performSegue(withIdentifier: "mainSegue", sender: self)

    }
    
//----------------------------------------------------------------------------------
    @IBAction func timeMode(_ sender: UIButton) {
gamemode = 1
performSegue(withIdentifier: "mainSegue", sender: self)
    }

    @IBAction func helpScreen(_ sender: UIButton) {
        

    }
    



}
