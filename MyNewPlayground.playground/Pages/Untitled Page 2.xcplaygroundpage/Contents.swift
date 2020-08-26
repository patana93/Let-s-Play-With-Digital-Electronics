//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Logic Gates
 
 ## More transistors, more fun!
 Imagine combining two or more transistors. These will create a logic gate represented by a nice symbol. At the input of a logic gate we can apply only two signals: on or off, that is 1 or 0 respectively.
 If you have noticed it, that was the same number of choices in the previous experiment: finger tapped (on) and finger released (off).
 Let’s explore what we can do with the three fundamental logic gates!
 
 
 ## AND Gate
 
 This is the AND logic gate:
 
 ![AND Gate](AndGateImage.pdf)
 
 Nice, isn’t it? The two pins at the bottom are the inputs, the one at the top is the output instead. The output will be set according to the status of the two inputs. The AND is the most demanding gate, in fact to set output to 1 we must have two inputs set to 1 at the same time!
 
 
 ## OR Gate
 
 The OR gate has more curved lines as you can see:
 
 ![OR Gate](OrGateImage.pdf)
 
 As you can easily understand from the name of it, in this case we only need one input set to 1. This is not a choosy gate!
 
 
 ## NOT Gate
 
 The sharpest gate of all is the NOT gate:
 
 ![NOTGate](NotGateImage.pdf)
 
 This gate has a single input and just swaps it. So, if you set 1 the output will be 0 and vice versa. It always says: I do NOT like your input human!
 
 
 
 ## Let's play with logic Gates!
 Now you are ready to help with a secret mission! Select the level from 1 to 3 and help me to obtain a 1 for each wire that directly links to the top screen. You can only tap the red digits. Once completed, get ready to access an amazing event!
 Good luck!
 */

//#-code-completion(everything, hide)
//#-hidden-code
class SecondScene: UIViewController {
    
    let scene = UIView()
    
    //#-end-hidden-code
    
    /*var levelSelected = /*#-editable-code*/<#T##Level Number##Int#>/*#-end-editable-code*/*/
    
    
    var levelSelected = 3
    
    //#-hidden-code
    var input1AndButton = UIButton()
    var input2AndButton = UIButton()
    var input3AndButton = UIButton()
    var input4AndButton = UIButton()
    var input1OrButton = UIButton()
    var input2OrButton = UIButton()
    var input1NotButton = UIButton()
    var input2NotButton = UIButton()
    var andResult = UILabel()
    var andResult2 = UILabel()
    var andResult3 = UILabel()
    var andResult4 = UILabel()
    var orResult = UILabel()
    var orResult2 = UILabel()
    var notResult = UILabel()
    var notResult2 = UILabel()
    let immagine = UIImageView()
    var answerScreen = UIImageView()
    var answerLabel = UILabel()
    
    override func loadView() {
        
        //set scene background
        scene.backgroundColor = UIColor.white
        
        //Use specific font
        let fontURL = Bundle.main.url(forResource: "digital-7", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        let font = UIFont(name: "digital-7", size: 25)
        
        //Set answer screen with label
        answerScreen = UIImageView()
        answerScreen.image = UIImage(named: "answerScreenBackground")
        answerLabel = UILabel()
        answerLabel.font = font?.withSize(35)
        answerLabel.text = "Access\nDenied"
        answerLabel.numberOfLines = 2
        answerLabel.textColor = .red
        answerLabel.textAlignment = .center
        
        //Set all the button to change title from 0 to 1 and vice versa
        input1AndButton.setTitleColor(.black, for: .normal)
        input1AndButton.titleLabel?.font = font?.withSize(25)
        input1AndButton.setTitleColor(UIColor.red, for: .normal)
        input1AndButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        input2AndButton.setTitleColor(.black, for: .normal)
        input2AndButton.titleLabel?.font = font?.withSize(25)
        input2AndButton.setTitleColor(UIColor.red, for: .normal)
        input2AndButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        input1OrButton.setTitleColor(.black, for: .normal)
        input1OrButton.titleLabel?.font = font?.withSize(25)
        input1OrButton.setTitleColor(UIColor.red, for: .normal)
        input1OrButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        input2OrButton.setTitleColor(.black, for: .normal)
        input2OrButton.titleLabel?.font = font?.withSize(25)
         input2OrButton.setTitleColor(UIColor.red, for: .normal)
        input2OrButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        input3AndButton.setTitleColor(.black, for: .normal)
        input3AndButton.titleLabel?.font = font?.withSize(25)
         input3AndButton.setTitleColor(UIColor.red, for: .normal)
        input3AndButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        input4AndButton.setTitleColor(.black, for: .normal)
        input4AndButton.titleLabel?.font = font?.withSize(25)
         input4AndButton.setTitleColor(UIColor.red, for: .normal)
        input4AndButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        input1NotButton.setTitleColor(.black, for: .normal)
        input1NotButton.titleLabel?.font = font?.withSize(25)
        input1NotButton.setTitleColor(UIColor.red, for: .normal)
        input1NotButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        //Set label of
        andResult.textColor = .black
        andResult.font = font?.withSize(25)
        
        orResult.textColor = .black
        orResult.font = font?.withSize(25)
        
        
        andResult2.textColor = .black
        andResult2.font = font?.withSize(25)
        
        notResult.textColor = .black
        notResult.font = font?.withSize(25)
        
        andResult3.textColor = .black
        andResult3.font = font?.withSize(25)
        
        orResult2.textColor = .black
        orResult2.font = font?.withSize(25)
        
        input2NotButton.setTitleColor(.black, for: .normal)
        input2NotButton.titleLabel?.font = font?.withSize(25)
        input2NotButton.setTitleColor(UIColor.red, for: .normal)
        input2NotButton.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        notResult2.textColor = .black
        notResult2.font = font?.withSize(25)
        
        andResult4.textColor = .black
        andResult4.font = font?.withSize(25)
        
        
        if(levelSelected == 1){
            setupLevel1View()
        }
        else if(levelSelected == 2){
            setupLevel2View()
        }
        else{
            setupLevel3View()
        }
        
        scene.addSubview(answerScreen)
        scene.addSubview(answerLabel)
        
        self.view = scene
    }
    
    override func viewDidLoad() {
        if(levelSelected == 1){
            setupLevel1Constraint()
        }
        else if(levelSelected == 2){
            setupLevel2Constraint()
        }
        else{
            setupLevel3Constraint()        }
    }
    
    
    func setupLevel3View(){
        immagine.image = UIImage(named: "logicGateLevel3")
        
        
        
        
        
        input1AndButton.setTitle("1", for: .normal)
        
        
        
        input2AndButton.setTitle("0", for: .normal)
        
        input1OrButton.setTitle("0", for: .normal)
        
        input2OrButton.setTitle("0", for: .normal)
        
        
        input3AndButton.setTitle("0", for: .normal)
        
        
        input4AndButton.setTitle("0", for: .normal)
        
        
        
        input1NotButton.setTitle("0", for: .normal)
        
        
        
        
        input2NotButton.setTitle("1", for: .normal)
        
        setOutput()
        
        scene.addSubview(immagine)
        scene.addSubview(input1AndButton)
        scene.addSubview(input2AndButton)
        scene.addSubview(input1OrButton)
        scene.addSubview(input2OrButton)
        scene.addSubview(input3AndButton)
        scene.addSubview(input4AndButton)
        scene.addSubview(input1NotButton)
        scene.addSubview(input2NotButton)
        scene.addSubview(andResult)
        scene.addSubview(orResult)
        scene.addSubview(andResult2)
        scene.addSubview(notResult)
        scene.addSubview(andResult3)
        scene.addSubview(orResult2)
        scene.addSubview(notResult2)
        scene.addSubview(andResult4)
    }
    
    func setupLevel3Constraint(){
        immagine.translatesAutoresizingMaskIntoConstraints = false
        immagine.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        immagine.centerYAnchor.constraint(equalTo: scene.centerYAnchor).isActive = true
        //immagine.topAnchor.constraint(equalTo: scene.topAnchor).isActive = true
        immagine.widthAnchor.constraint(equalToConstant:   512).isActive = true
        immagine.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        answerScreen.translatesAutoresizingMaskIntoConstraints = false
        answerScreen.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        answerScreen.topAnchor.constraint(equalTo: immagine.topAnchor, constant: -17).isActive = true
        answerScreen.widthAnchor.constraint(equalToConstant:   200).isActive = true
        answerScreen.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerXAnchor.constraint(equalTo: answerScreen.centerXAnchor).isActive = true
        answerLabel.centerYAnchor.constraint(equalTo: answerScreen.centerYAnchor).isActive = true
        
        
        input1AndButton.translatesAutoresizingMaskIntoConstraints = false
        input1AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -222).isActive = true
        input1AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        input2AndButton.translatesAutoresizingMaskIntoConstraints = false
        input2AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -197).isActive = true
        input2AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        input1OrButton.translatesAutoresizingMaskIntoConstraints = false
        input1OrButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -120).isActive = true
        input1OrButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        input2OrButton.translatesAutoresizingMaskIntoConstraints = false
        input2OrButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -95).isActive = true
        input2OrButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        input1NotButton.translatesAutoresizingMaskIntoConstraints = false
        input1NotButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -6).isActive = true
        input1NotButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        
        input3AndButton.translatesAutoresizingMaskIntoConstraints = false
        input3AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 91).isActive = true
        input3AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        input4AndButton.translatesAutoresizingMaskIntoConstraints = false
        input4AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 116).isActive = true
        input4AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        input2NotButton.translatesAutoresizingMaskIntoConstraints = false
        input2NotButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 200).isActive = true
        input2NotButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        andResult.translatesAutoresizingMaskIntoConstraints = false
        andResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -178).isActive = true
        andResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -160).isActive = true
        andResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        orResult.translatesAutoresizingMaskIntoConstraints = false
        orResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -105).isActive = true
        orResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -160).isActive = true
        orResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        orResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        notResult.translatesAutoresizingMaskIntoConstraints = false
        notResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -5).isActive = true
        notResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -160).isActive = true
        notResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        notResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        andResult2.translatesAutoresizingMaskIntoConstraints = false
        andResult2.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 135).isActive = true
        andResult2.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -162).isActive = true
        andResult2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        notResult2.translatesAutoresizingMaskIntoConstraints = false
        notResult2.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 208).isActive = true
        notResult2.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -162).isActive = true
        notResult2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        notResult2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        andResult3.translatesAutoresizingMaskIntoConstraints = false
        andResult3.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -80).isActive = true
        andResult3.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -240).isActive = true
        andResult3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        orResult2.translatesAutoresizingMaskIntoConstraints = false
        orResult2.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 105).isActive = true
        orResult2.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -240).isActive = true
        orResult2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        orResult2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        andResult4.translatesAutoresizingMaskIntoConstraints = false
        andResult4.centerXAnchor.constraint(equalTo: immagine.centerXAnchor).isActive = true
        andResult4.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -301).isActive = true
        andResult4.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult4.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupLevel2Constraint(){
        
        immagine.translatesAutoresizingMaskIntoConstraints = false
        immagine.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        immagine.centerYAnchor.constraint(equalTo: scene.centerYAnchor).isActive = true
        //immagine.topAnchor.constraint(equalTo: scene.topAnchor).isActive = true
        immagine.widthAnchor.constraint(equalToConstant:   512).isActive = true
        immagine.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        answerScreen.translatesAutoresizingMaskIntoConstraints = false
        answerScreen.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        answerScreen.topAnchor.constraint(equalTo: immagine.topAnchor, constant: -17).isActive = true
        answerScreen.widthAnchor.constraint(equalToConstant:   200).isActive = true
        answerScreen.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerXAnchor.constraint(equalTo: answerScreen.centerXAnchor).isActive = true
        answerLabel.centerYAnchor.constraint(equalTo: answerScreen.centerYAnchor).isActive = true
        
        input1AndButton.translatesAutoresizingMaskIntoConstraints = false
        input1AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -143).isActive = true
        input1AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -20).isActive = true
        
        input2AndButton.translatesAutoresizingMaskIntoConstraints = false
        input2AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -118).isActive = true
        input2AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -20).isActive = true
        
        
        input1OrButton.translatesAutoresizingMaskIntoConstraints = false
        input1OrButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -40).isActive = true
        input1OrButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -20).isActive = true
        
        input2OrButton.translatesAutoresizingMaskIntoConstraints = false
        input2OrButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -15).isActive = true
        input2OrButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -20).isActive = true
        
        input3AndButton.translatesAutoresizingMaskIntoConstraints = false
        input3AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 27).isActive = true
        input3AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -20).isActive = true
        
        input4AndButton.translatesAutoresizingMaskIntoConstraints = false
        input4AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 52).isActive = true
        input4AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -20).isActive = true
        
        input1NotButton.translatesAutoresizingMaskIntoConstraints = false
        input1NotButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 136).isActive = true
        input1NotButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -20).isActive = true
        
        
        
        andResult.translatesAutoresizingMaskIntoConstraints = false
        andResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -124).isActive = true
        andResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -150).isActive = true
        andResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        orResult.translatesAutoresizingMaskIntoConstraints = false
        orResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -22).isActive = true
        orResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -150).isActive = true
        orResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        orResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        andResult2.translatesAutoresizingMaskIntoConstraints = false
        andResult2.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 47).isActive = true
        andResult2.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -150).isActive = true
        andResult2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        notResult.translatesAutoresizingMaskIntoConstraints = false
        notResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 144).isActive = true
        notResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -150).isActive = true
        notResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        notResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        andResult3.translatesAutoresizingMaskIntoConstraints = false
        andResult3.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -75).isActive = true
        andResult3.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -285).isActive = true
        andResult3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        orResult2.translatesAutoresizingMaskIntoConstraints = false
        orResult2.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 95).isActive = true
        orResult2.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -285).isActive = true
        orResult2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        orResult2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setupLevel2View(){
        
        immagine.image = UIImage(named: "logicGateLevel2")
        
        
        
        input1AndButton.setTitle("0", for: .normal)
        
        
        
        
        input2AndButton.setTitle("1", for: .normal)
        
        
        input1OrButton.setTitle("0", for: .normal)
        
        
        input2OrButton.setTitle("0", for: .normal)
        
        
        input3AndButton.setTitle("1", for: .normal)
        
        
        input4AndButton.setTitle("0", for: .normal)
        
        
        
        input1NotButton.setTitle("1", for: .normal)
        
        
        setOutput()
        
        
        scene.addSubview(immagine)
        scene.addSubview(input1AndButton)
        scene.addSubview(input2AndButton)
        scene.addSubview(input1OrButton)
        scene.addSubview(input2OrButton)
        scene.addSubview(input3AndButton)
        scene.addSubview(input4AndButton)
        scene.addSubview(input1NotButton)
        scene.addSubview(andResult)
        scene.addSubview(orResult)
        scene.addSubview(andResult2)
        scene.addSubview(notResult)
        scene.addSubview(andResult3)
        scene.addSubview(orResult2)
    }
    
    func setupLevel1View(){
        
        immagine.image = UIImage(named: "logicGateLevel1")
        
        
        input1AndButton.setTitle("0", for: .normal)
        
        
        input2AndButton.setTitle("1", for: .normal)
        
        
        
        
        
        //OR GATE
        
        
        input1OrButton.setTitle("0", for: .normal)
        
        
        
        input2OrButton.setTitle("0", for: .normal)
        
        
        
        
        
        //NOT GATE
        
        
        input1NotButton.setTitle("1", for: .normal)
        
        
        
        setOutput()
        
        
        scene.addSubview(immagine)
        scene.addSubview(input1AndButton)
        scene.addSubview(input2AndButton)
        scene.addSubview(andResult)
        scene.addSubview(input1OrButton)
        scene.addSubview(input2OrButton)
        scene.addSubview(orResult)
        scene.addSubview(input1NotButton)
        scene.addSubview(notResult)
        
    }
    
    func setupLevel1Constraint(){
        immagine.translatesAutoresizingMaskIntoConstraints = false
        immagine.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        immagine.centerYAnchor.constraint(equalTo: scene.centerYAnchor).isActive = true
        //immagine.topAnchor.constraint(equalTo: scene.topAnchor).isActive = true
        immagine.widthAnchor.constraint(equalToConstant:   512).isActive = true
        immagine.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        answerScreen.translatesAutoresizingMaskIntoConstraints = false
        answerScreen.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        answerScreen.topAnchor.constraint(equalTo: immagine.topAnchor, constant: 54).isActive = true
        answerScreen.widthAnchor.constraint(equalToConstant:   200).isActive = true
        answerScreen.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerXAnchor.constraint(equalTo: answerScreen.centerXAnchor).isActive = true
        answerLabel.centerYAnchor.constraint(equalTo: answerScreen.centerYAnchor).isActive = true
        
        
        input1AndButton.translatesAutoresizingMaskIntoConstraints = false
        input1AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -93).isActive = true
        input1AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        input2AndButton.translatesAutoresizingMaskIntoConstraints = false
        input2AndButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -68).isActive = true
        input2AndButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        
        andResult.translatesAutoresizingMaskIntoConstraints = false
        andResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -78).isActive = true
        andResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -130).isActive = true
        andResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        andResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        input1OrButton.translatesAutoresizingMaskIntoConstraints = false
        input1OrButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: -15).isActive = true
        input1OrButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        input2OrButton.translatesAutoresizingMaskIntoConstraints = false
        input2OrButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 10).isActive = true
        input2OrButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        
        orResult.translatesAutoresizingMaskIntoConstraints = false
        orResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor).isActive = true
        orResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -130).isActive = true
        orResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        orResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        input1NotButton.translatesAutoresizingMaskIntoConstraints = false
        input1NotButton.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 79).isActive = true
        input1NotButton.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -15).isActive = true
        
        
        
        notResult.translatesAutoresizingMaskIntoConstraints = false
        notResult.centerXAnchor.constraint(equalTo: immagine.centerXAnchor, constant: 83).isActive = true
        notResult.topAnchor.constraint(equalTo: immagine.bottomAnchor, constant: -130).isActive = true
        notResult.widthAnchor.constraint(equalToConstant: 50).isActive = true
        notResult.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        
        if(input1AndButton.titleLabel?.text == "1" && input2AndButton.titleLabel?.text == "1"){
            andResult.text = "1"
        }
        else{
            andResult.text = "0"
        }
        
        if(input1OrButton.titleLabel?.text == "1" || input2OrButton.titleLabel?.text == "1"){
            orResult.text = "1"
        }
        else{
            orResult.text = "0"
        }
        
        if(input1NotButton.titleLabel?.text == "1"){
            notResult.text = "0"
        }
        else{
            notResult.text = "1"
        }
        
        if(input2NotButton.titleLabel?.text == "1"){
            notResult2.text = "0"
        }
        else{
            notResult2.text = "1"
        }
        
        if(input3AndButton.titleLabel?.text == "1" && input4AndButton.titleLabel?.text == "1"){
            andResult2.text = "1"
        }
        else{
            andResult2.text = "0"
        }
        
        if(levelSelected == 1){
            if(andResult.text == "1" && orResult.text == "1" && notResult.text == "1"){
                answerLabel.text = "ACCESS\nALLOWED"
                answerLabel.textColor = .green
            }
            else{
                answerLabel.text = "ACCESS\nDENIED"
                answerLabel.textColor = .red
            }
        }
        else if(levelSelected == 2){
            if(andResult.text == "1" && orResult.text == "1"){
                andResult3.text = "1"
            }
            else{
                andResult3.text = "0"
            }
            
            if(andResult2.text == "1" || notResult.text == "1"){
                orResult2.text = "1"
            }
            else{
                orResult2.text = "0"
            }
            
            if(andResult3.text == "1" && orResult2.text == "1"){
                andResult4.text = "1"
                answerLabel.text = "ACCESS\nALLOWED"
                answerLabel.textColor = .green
            }
            else{
                andResult4.text = "0"
                answerLabel.text = "ACCESS\nDENIED"
                answerLabel.textColor = .red
            }
        }
        else{
            if(andResult.text == "1" && orResult.text == "1"){
                andResult3.text = "1"
            }
            else{
                andResult3.text = "0"
            }
            if(andResult2.text == "1" || notResult2.text == "1"){
                orResult2.text = "1"
            }
            else{
                orResult2.text = "0"
            }
            if(andResult3.text == "1" && notResult.text == "1" && orResult2.text == "1"){
                andResult4.text = "1"
                answerLabel.text = "ACCESS\nALLOWED"
                answerLabel.textColor = .green
            }
            else{
                andResult4.text = "0"
                answerLabel.text = "ACCESS\nDENIED"
                answerLabel.textColor = .red
            }
        }
    }
}
//Set the scene
let host = SecondScene()
host.preferredContentSize = CGSize(width: 512, height: 384)
//PlaygroundPage.current.liveView = host
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundSupport.PlaygroundPage.current.liveView = host
//#-end-hidden-code
//: [Next](@next)
