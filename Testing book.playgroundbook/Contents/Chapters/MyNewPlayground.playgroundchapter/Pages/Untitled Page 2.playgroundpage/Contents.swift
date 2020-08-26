//#-hidden-code
import UIKit
//#-end-hidden-code

//: [Previous](@previous)
import UIKit
import PlaygroundSupport

class SecondScene: UIViewController {
    
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var button4 = UIButton()
    var button5 = UIButton()
    var andResult = UILabel()
    var orResult = UILabel()
    var notResult = UILabel()
        
    override func loadView() {
       
        let scene = UIView()
        scene.backgroundColor = .yellow
        
        
        //AND GATE
        let immagine = UIImageView(frame: CGRect(x: 60, y: 60, width: 80, height: 50))
        immagine.image = UIImage(named: "andgate")
        
        button1 = UIButton(frame: CGRect(x: 40, y: 48, width: 30, height: 30))
        button1.setTitle("1", for: .normal)
        button1.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        button2 = UIButton(frame: CGRect(x: 40, y: 90, width: 30, height: 30))
        button2.setTitle("1", for: .normal)
        button2.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        andResult = UILabel(frame: CGRect(x: 145, y: 70, width: 30, height: 30))
        andResult.text = "1"
        
        //OR GATE
        let immagine2 = UIImageView(frame: CGRect(x: 60, y: 120, width: 100, height: 120))
        immagine2.image = UIImage(named: "orgate")
        
        button3 = UIButton(frame: CGRect(x: 45, y: 145, width: 30, height: 30))
        button3.setTitle("1", for: .normal)
        button3.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        button4 = UIButton(frame: CGRect(x: 45, y: 185, width: 30, height: 30))
        button4.setTitle("1", for: .normal)
        button4.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        orResult = UILabel(frame: CGRect(x: 155, y: 165, width: 30, height: 30))
        orResult.text = "1"
        
        //NOT GATE
        let immagine3 = UIImageView(frame: CGRect(x: 60, y: 240, width: 100, height: 60))
        immagine3.image = UIImage(named: "notgate")
        
        button5 = UIButton(frame: CGRect(x: 45, y: 245, width: 30, height: 30))
        button5.setTitle("1", for: .normal)
        button5.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        notResult = UILabel(frame: CGRect(x: 155, y: 245, width: 30, height: 30))
        notResult.text = "0"
        
        

        
        
        scene.addSubview(immagine)
        scene.addSubview(button1)
        scene.addSubview(button2)
        scene.addSubview(andResult)
        scene.addSubview(immagine2)
        scene.addSubview(button3)
        scene.addSubview(button4)
        scene.addSubview(orResult)
        scene.addSubview(immagine3)
        scene.addSubview(button5)
        scene.addSubview(notResult)
        self.view = scene
    }
    

    @objc func changeState(_ sender: UIButton){
        if(sender.titleLabel?.text == "0"){
            sender.setTitle("1", for: .normal)
        }
        else{
            sender.setTitle("0", for: .normal)
        }
        setOutput()
    }
    
    func setOutput(){
        if(button1.titleLabel?.text == "1" && button2.titleLabel?.text == "1"){
            andResult.text = "1"
        }
        else{
            andResult.text = "0"
        }
        
        if(button3.titleLabel?.text == "1" || button4.titleLabel?.text == "1"){
            orResult.text = "1"
        }
        else{
            orResult.text = "0"
        }
        if(button5.titleLabel?.text == "1"){
            notResult.text = "0"
        }
        else{
            notResult.text = "1"
        }
    }
    
}
//Set the scene
PlaygroundSupport.PlaygroundPage.current.liveView = SecondScene()
//: [Next](@next)