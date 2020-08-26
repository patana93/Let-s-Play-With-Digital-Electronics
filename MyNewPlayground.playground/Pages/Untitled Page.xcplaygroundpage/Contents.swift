//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Transistor
 
 ## What is it?
 
 
 A transistor is an electronic device that we use everyday!
 Right now, they are working very hard indeed to make your device run. It is not easy to count them…they are some millions!
 It looks like this:
 
 ![Transistor](TransistorImage.pdf)
 
 
 ## How to use it
 
 They can be used in many configurations, like audio amplifier, but we will see how to utilize them in digital electronics as a switch.
 In this experiment you will be able to turn on a neon with the power of your finger! You just have to close the circuit tapping the gap between the two wires (don’t worry it’s not dangerous!).
 
 
 ## Let's create a switch!
 
 Just use this function to test the circuit. Choose a writing and a color, then let’s run the code and make it happen!
 When you finish, let’s see how happen when we create [Logic Gates](@next) with transistors!
 */

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, createCircuit(label:colorLight:)

//#-hidden-code
class FirstScene: UIViewController {
    
    var writing = UILabel()
    var labelColor: UIColor = .red
    var backgroundImage = UIImageView()
    let scene = UIView()
    let bottone = UIButton()
    
    override func loadView() {
        //Set scene background
        scene.backgroundColor = UIColor.white
        backgroundImage = UIImageView(image: UIImage(named: "transistorBackground"))
        
        //Set the writing
        writing = UILabel()
        let fontURL = Bundle.main.url(forResource: "Lovelo-LineBold", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        let font = UIFont(name: "Lovelo-LineBold", size: 60)
        writing.textAlignment = .center
        writing.font = font
        writing.text = "Hello World"
        writing.layer.borderColor = UIColor.black.cgColor
        writing.layer.borderWidth = 8
        writing.layer.cornerRadius = 20
        writing.baselineAdjustment = .alignCenters
        writing.adjustsFontSizeToFitWidth = true
        writing.textColor = UIColor.black

        bottone.setTitleColor(.black, for: .normal)
        bottone.setTitleColor(.red, for: .highlighted)
        bottone.addTarget(self, action: #selector(self.circuitClosed), for: .touchDown)
        bottone.addTarget(self, action: #selector(self.circuitOpened), for: .touchUpInside)
        bottone.addTarget(self, action: #selector(self.circuitOpened), for: .touchDragExit)
        
        
        scene.addSubview(writing)
        scene.addSubview(backgroundImage)
        scene.addSubview(bottone)
        
        self.view = scene
        
        
        //#-end-hidden-code
        //#-editable-code
        createCircuit(writing: "Hello World", colorLight: #colorLiteral(red: 255, green: 0, blue: 0, alpha: 1))
        //#-end-editable-code
        //#-hidden-code
    }
    
    
    override func viewDidLoad() {
           //Set Constraints
           backgroundImage.translatesAutoresizingMaskIntoConstraints = false
           backgroundImage.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
           backgroundImage.centerYAnchor.constraint(equalTo: scene.centerYAnchor).isActive = true
           
           writing.translatesAutoresizingMaskIntoConstraints = false
           writing.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor,constant: -20).isActive = true
           writing.bottomAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 165).isActive = true
           writing.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor, constant: -50).isActive = true
           writing.heightAnchor.constraint(equalToConstant: 90).isActive = true
           
           bottone.translatesAutoresizingMaskIntoConstraints = false
           bottone.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
           bottone.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor).isActive = true
           bottone.widthAnchor.constraint(equalToConstant: 120).isActive = true
           bottone.heightAnchor.constraint(equalToConstant: 30).isActive = true
           
           backgroundImage.widthAnchor.constraint(equalToConstant:   512).isActive = true
           backgroundImage.heightAnchor.constraint(equalToConstant: 450).isActive = true
           scene.sendSubviewToBack(backgroundImage)
           
       }
    
    
    func createCircuit(writing: String, colorLight: UIColor){
        //Parse the input of user
        self.writing.text = writing
        labelColor = colorLight
    }
    
    @objc func circuitClosed(){
        //Animation for circuit closed
        self.writing.textColor = self.labelColor
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.writing.layer.shadowColor = self.labelColor.cgColor
            self.writing.layer.borderColor = self.labelColor.cgColor
            self.writing.layer.shadowRadius = 9.0
            self.writing.layer.shadowOpacity = 10
            self.writing.layer.shadowOffset = CGSize(width: 0, height:
                0)
            self.writing.layer.masksToBounds = false
        }, completion: nil)
    }
    
    @objc func circuitOpened(){
        //Animation for circuit opened
        writing.layer.removeAllAnimations()
        self.writing.layer.shadowRadius = 0
        self.writing.layer.shadowOpacity = 0
        self.writing.layer.shadowOffset = CGSize(width: 0, height:
            0)
        self.writing.layer.masksToBounds = false
        writing.textColor = UIColor.black
        self.writing.layer.borderColor = UIColor.black.cgColor
        
    }
}
//Set the scene
let firstView = FirstScene()
firstView.preferredContentSize = CGSize(width: 512, height: 384)
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundSupport.PlaygroundPage.current.liveView = firstView
//#-end-hidden-code
