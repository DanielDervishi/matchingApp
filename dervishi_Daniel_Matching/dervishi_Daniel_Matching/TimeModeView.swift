
import UIKit

class TimeModeView: UIViewController {
    
    var theThing: [UIImage] = [#imageLiteral(resourceName: "cycling"),#imageLiteral(resourceName: "cycling"),#imageLiteral(resourceName: "abseiling"),#imageLiteral(resourceName: "abseiling"), #imageLiteral(resourceName: "volleyball-player-motion") , #imageLiteral(resourceName: "volleyball-player-motion") ,#imageLiteral(resourceName: "river-rafting"),#imageLiteral(resourceName: "river-rafting"),#imageLiteral(resourceName: "throwing-javelin"),#imageLiteral(resourceName: "throwing-javelin"),#imageLiteral(resourceName: "tennis-player-with-racket (1)"),#imageLiteral(resourceName: "tennis-player-with-racket (1)"),#imageLiteral(resourceName: "weight-lifting"),#imageLiteral(resourceName: "weight-lifting"),#imageLiteral(resourceName: "skateboarder"),#imageLiteral(resourceName: "skateboarder")]
    var intArray: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        theThing.shuffle()

    }
       var bothFlipped = 0
        var btnThingy = 0
     var exponential = 0
        var score = 0
        @IBAction func btnCollectionPressed(_ sender: UIButton) {

            bothFlipped += 1
            if bothFlipped == 1{

    sender.setImage(theThing[sender.tag - 1], for: .normal)
    btnThingy = sender.tag - 1
                sender.isEnabled = false

            }else if bothFlipped == 2{
                sender.isEnabled = false
                for index in intArray{
                                   btnCollection[index].isEnabled = false
                               }
    sender.setImage(theThing[sender.tag - 1], for: .normal)
    bothFlipped = 0
                for index in intArray{
                    btnCollection[index].isEnabled = false
                }
                if sender.image(for: .normal) == btnCollection[btnThingy].image(for: .normal){

                    sender.isEnabled = false
                    btnCollection[btnThingy].isEnabled = false

                    btnCollection[sender.tag - 1].isEnabled = false
                    btnCollection[btnThingy].isEnabled = false
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
        for index in self.intArray{
        self.btnCollection[index].isEnabled = true
                }
                    }
                 intArray =  intArray.filter {$0 != btnThingy}
                   intArray = intArray.filter {$0 != sender.tag - 1}
                                    print(intArray)
                    score += Int(pow(2, Double(exponential)))
                    exponential += 1
                }else{
                    exponential = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                sender.setImage(#imageLiteral(resourceName: "baraam"), for: .normal)
                    self.btnCollection[self.btnThingy].setImage(#imageLiteral(resourceName: "baraam"), for: .normal)
                        for index in self.intArray{
                        self.btnCollection[index].isEnabled = true
                                }
                    }
            }
        }
            LblScore.text = "\(score)"
    }
    }

}
