import UIKit

class pictureThingClass: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//Give all the buttons tags
        for i in 0...8{
            btnCollection[i].tag = i
        }
        btnCollection[8].isEnabled = false
    }
        @IBOutlet var btnCollection: [UIButton]!
    var emptyPosition = -100
    var ArrayForGrid = [0,1,2,3,4,5,6,7,8]
    @IBAction func btnCollectionPressed(_ sender: UIButton) {
        for i in 0...8{
            if ArrayForGrid[i] == 8{
                emptyPosition = i
                break
            }
        }
        print(sender.tag)
        
        if sender.tag == emptyPosition - 3 || sender.tag == emptyPosition + 3{
        ArrayForGrid.swapAt(emptyPosition, ArrayForGrid[sender.tag])
            btnCollection[sender.tag].isEnabled = false
            btnCollection[emptyPosition].isEnabled = true
            print(ArrayForGrid)
        }else if emptyPosition == 2 || emptyPosition == 5 || emptyPosition == 8 && sender.tag == emptyPosition - 1{
            ArrayForGrid.swapAt(emptyPosition, ArrayForGrid[sender.tag])
            btnCollection[sender.tag].isEnabled = false
            btnCollection[emptyPosition].isEnabled = true
        }else if emptyPosition == 0 || emptyPosition == 3 || emptyPosition == 6 && sender.tag == emptyPosition + 1{
        ArrayForGrid.swapAt(emptyPosition, ArrayForGrid[sender.tag])
            btnCollection[sender.tag].isEnabled = false
            btnCollection[emptyPosition].isEnabled = true
        }else if sender.tag == emptyPosition - 1 || sender.tag == emptyPosition + 1 || emptyPosition == 1 || emptyPosition == 4 || emptyPosition == 7{
            ArrayForGrid.swapAt(emptyPosition, ArrayForGrid[sender.tag])
            btnCollection[sender.tag].isEnabled = false
            btnCollection[emptyPosition].isEnabled = true
        }
//        print(ArrayForGrid)
        for i in 0...8{
            if ArrayForGrid[i] == 8 {
                btnCollection[i].setTitle("Empty", for: .normal)
            }else{
btnCollection[i].setTitle(String(ArrayForGrid[i] + 1), for: .normal)
            }
        }

}
}
