
import UIKit

class ViewController: UIViewController {

    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    var round = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createRound()
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onLeftButtonClick))
        leftSwipeRecognizer.direction = .left
        self.view.addGestureRecognizer(leftSwipeRecognizer)
        
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onRightButtonClick))
        rightSwipeRecognizer.direction = .right
        self.view.addGestureRecognizer(rightSwipeRecognizer)
        
        let upSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onUpButtonClick))
        upSwipeRecognizer.direction = .up
        self.view.addGestureRecognizer(upSwipeRecognizer)
        
        let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onDownButtonClick))
        downSwipeRecognizer.direction = .down
        self.view.addGestureRecognizer(downSwipeRecognizer)
    }
    
    
    
    
    
    func createRound() {
        round.frame = CGRect(x: (screenWidth - 100) / 2, y: (screenHeight-100) / 2, width: 100, height: 100)
        round.backgroundColor = getRandomColour()
        round.layer.cornerRadius = round.frame.size.width / 2
        view.addSubview(round)
    }
       
    
    func getRandomColour() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0...1),
                       green: CGFloat.random(in: 0...1),
                       blue: CGFloat.random(in: 0...1),
                       alpha: 1.0)
    }
 
    
    @objc func onUpButtonClick() {
        if round.frame.origin.y.isLess(than: 50) {
            round.frame = round.frame.offsetBy(dx: 0, dy: 0)
        } else {
            round.frame = round.frame.offsetBy(dx: 0, dy: -50)
        }
    }
    
    @objc func onDownButtonClick() {
        if round.frame.origin.y.isLess(than: screenHeight - 150) {
            round.frame = round.frame.offsetBy(dx: 0, dy: 50)
        } else {
            round.frame = round.frame.offsetBy(dx: 0, dy: 0)
        }
    }
    
    @objc func onLeftButtonClick() {
        if round.frame.origin.x.isLess(than: 50) {
            round.frame = round.frame.offsetBy(dx: 0, dy: 0)
        } else {
            round.frame = round.frame.offsetBy(dx: -50, dy: 0)
        }
    }
    @objc func onRightButtonClick() {
        if round.frame.origin.x.isLess(than: screenWidth -  150) {
            round.frame = round.frame.offsetBy(dx: 50, dy: 0)
        } else {
            round.frame = round.frame.offsetBy(dx: 0, dy: 0)
        }
    }
    
    
}

