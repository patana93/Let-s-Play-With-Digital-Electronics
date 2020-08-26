//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
/*:
 # 14 Segment Display
 
 ## More Logic Gates, more fun!
 Again, imagine combining two or more logic gates to create an integrated circuit (IC) like this:
 
 ![IC](ICImage.pdf)
 
 They can be used in many different ways, but now we are going to analyze a particular one. We will simulate an IC that drives a little 14 segments display, like those used in the car stereos.
 
 
 
 ## How IC works?
 It’s very simple! We can set “n” inputs and obtain 2^n outputs.
 For instance, if we want to map alphabet letters and numbers from 0 to 9, we will need 36 output lines (26 letters and 10 digits). This will make our circuit a nightmare! To solve this problem, we have to find the “n” exponent that elevates 2 and gives us at least 36.
 Spoiler Alert! The solution is 6, in fact 2^6 = 64. In this way we just need 6 inputs.
 
 ## How display works?
 Well, it’s called 14 segments display because… it has 14 segments.
 A letter identifies each of them. If we turn on some segments, we will obtain symbols like letters or digits.
 For instance, if we turn on the segments A, B, C, E, F, L, M, we will obtain the A letter:
 
 ![14 segment display](14SegmentImage.pdf)
 
 
 ## Help me to find the password!
 Last mission to complete! Find the password to get the access to an amazing event!
 Select the letter that you think is right from the picker and press “Send Letter”. If you are brave enough, you can try changing the numbers directly from input
 
 
 */
//#-code-completion(everything, hide)
//#-hidden-code
class ThirdScene: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerView = UIPickerView()
    var display = sevenSegmentDisplay()
    let scene = UIView()
    var symbolsArray: [String] = []
    var firstDigit = UIButton()
    var secondDigit = UIButton()
    var thirdDigit = UIButton()
    var fourthDigit = UIButton()
    var fifthDigit = UIButton()
    var sixthDigit = UIButton()
    var currentLetterAnswer = ""
    var userAnswer = ""
    var answer = "WWDC20"
    var sendLetterButton = UIButton()
    var answerLabel = UILabel()
    var answerScreen = UIView()
    var answerScreenBackground = UIImageView()
    var circuitImage = UIImageView()
    var timerLabel = UILabel()
    var timerCount = 90
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return symbolsArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Set display and digits according to pickerview selection
        display.setDisplay(inputCode: symbolsArray[row])
        setButtons(letterSelected:symbolsArray[row])
    }
    
    func setButtons(letterSelected: String){
        //Set title of button based on the state of picker
        let outputCode = display.getInputCode(letter: letterSelected)
        print(display.getInputCode(letter: letterSelected))
        
        firstDigit.setTitle(String(outputCode[outputCode.startIndex]), for: .normal)
        
        secondDigit.setTitle(String(outputCode[outputCode.index(outputCode.startIndex, offsetBy: 1)]), for: .normal)
        thirdDigit.setTitle(String(outputCode[outputCode.index(outputCode.startIndex, offsetBy: 2)]), for: .normal)
        fourthDigit.setTitle(String(outputCode[outputCode.index(outputCode.startIndex, offsetBy: 3)]), for: .normal)
        fifthDigit.setTitle(String(outputCode[outputCode.index(outputCode.startIndex, offsetBy: 4)]), for: .normal)
        sixthDigit.setTitle(String(outputCode[outputCode.index(outputCode.startIndex, offsetBy: 5)]), for: .normal)
        
        display.getOutputCodeFromInputCode(codeInput:
            (firstDigit.titleLabel?.text)! + (secondDigit.titleLabel?.text)! +
                (thirdDigit.titleLabel?.text)! +
                (fourthDigit.titleLabel?.text)! +
                (fifthDigit.titleLabel?.text)! +
                (sixthDigit.titleLabel?.text)!)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //Customize picker view to set it horizontal
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 70, height: 350)
        
        let label = UILabel(frame: CGRect(x: 0, y: 25, width: 70, height: 350))
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.text = symbolsArray[row]
        let font = UIFont(name: "digital-7", size: 45)
        label.font = font
        view.addSubview(label)
        
        view.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/2)
        
        return view
    }
    
    override func loadView() {
        
        //Set scene background
        scene.backgroundColor = .white
        
        //Set Display
        display = sevenSegmentDisplay(frame: CGRect(x: self.scene.center.x, y: self.scene.center.y, width: 200, height: 200))
        
        //Set and sort symbols array using the dictionary in sevenSegmentDisplay class
        symbolsArray = display.getSymbolInDictionary()
        symbolsArray.sort()
        
        //Set pickerview
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.transform = CGAffineTransform.init(rotationAngle: -CGFloat.pi/2)
        
        //Set background image
        circuitImage.image = UIImage(named: "fourtheenSegmentBackground")
        
        //Set Answer Screen
        answerScreen = UIView(frame: CGRect(x: 10, y: 70, width: 250, height: 100))
        answerScreenBackground.image = UIImage(named: "answerScreenBackground")
        answerScreen.addSubview(answerScreenBackground)
        answerScreen.sendSubviewToBack(answerScreenBackground)
        //Set Font
        let fontURL = Bundle.main.url(forResource: "digital-7", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        let font = UIFont(name: "digital-7", size: 50)
        
        //Set Timer
        timerLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 30))
        timerLabel.font = font
        timerLabel.textAlignment = .center
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            if(self.timerCount > 0){
                self.timerCount -= 1
                self.timerLabel.text = String(self.timerCount)
            }
            if(self.timerCount == 0){
                self.answerLabel.textColor = UIColor.red
                self.answerLabel.text = "Mission Failed"
                self.sendLetterButton.titleLabel?.text = "Try Again"
                self.sendLetterButton.removeTarget(self, action: #selector(self.sendAnswer), for: .touchUpInside)
                self.sendLetterButton.addTarget(self, action: #selector(self.tryAgain), for: .touchUpInside)
            }
        }
        
        //Set answer Label
        answerLabel.textAlignment = .center
        answerLabel.numberOfLines = 2
        answerLabel.font = font
        answerScreen.layer.borderWidth = 10
        answerScreen.layer.cornerRadius = 10
        answerLabel.text = "WELCOME TO\n ------"
        answerLabel.clipsToBounds = true
        
        //Set sendLetterButton
        sendLetterButton.setTitle("Send Letter", for: .normal)
        sendLetterButton.setTitleColor(.black, for: .normal)
        sendLetterButton.titleLabel?.textAlignment = .center
        sendLetterButton.addTarget(self, action: #selector(sendAnswer), for: .touchUpInside)
        
        //Set button for each digits
        firstDigit = UIButton(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        firstDigit.setTitle("1", for: .normal)
        firstDigit.setTitleColor(.black, for: .normal)
        firstDigit.titleLabel?.font = font?.withSize(30)
        firstDigit.addTarget(self, action: #selector(changeState(_:)), for: .touchUpInside)
        
        secondDigit = UIButton(frame: CGRect(x: 40, y: 10, width: 30, height: 30))
        secondDigit.setTitle("1", for: .normal)
        secondDigit.setTitleColor(.black, for: .normal)
        secondDigit.titleLabel?.font = font?.withSize(30)
        secondDigit.addTarget(self, action: #selector(changeState(_:)), for: .touchUpInside)
        
        thirdDigit = UIButton(frame: CGRect(x: 80, y: 10, width: 30, height: 30))
        thirdDigit.setTitle("1", for: .normal)
        thirdDigit.setTitleColor(.black, for: .normal)
        thirdDigit.titleLabel?.font = font?.withSize(30)
        thirdDigit.addTarget(self, action: #selector(changeState(_:)), for: .touchUpInside)
        
        fourthDigit = UIButton(frame: CGRect(x: 120, y: 10, width: 30, height: 30))
        fourthDigit.setTitle("1", for: .normal)
        fourthDigit.setTitleColor(.black, for: .normal)
        fourthDigit.titleLabel?.font = font?.withSize(30)
        fourthDigit.addTarget(self, action: #selector(changeState(_:)), for: .touchUpInside)
        
        fifthDigit = UIButton(frame: CGRect(x: 150, y: 10, width: 30, height: 30))
        fifthDigit.setTitle("1", for: .normal)
        fifthDigit.setTitleColor(.black, for: .normal)
        fifthDigit.titleLabel?.font = font?.withSize(30)
        fifthDigit.addTarget(self, action: #selector(changeState(_:)), for: .touchUpInside)
        
        sixthDigit = UIButton(frame: CGRect(x: 180, y: 10, width: 30, height: 30))
        sixthDigit.setTitle("1", for: .normal)
        sixthDigit.setTitleColor(.black, for: .normal)
        sixthDigit.titleLabel?.font = font?.withSize(30)
        sixthDigit.addTarget(self, action: #selector(changeState(_:)), for: .touchUpInside)
        
        scene.addSubview(circuitImage)
        scene.addSubview(display)
        scene.addSubview(answerScreen)
        scene.addSubview(answerLabel)
        scene.addSubview(firstDigit)
        scene.addSubview(secondDigit)
        scene.addSubview(thirdDigit)
        scene.addSubview(fourthDigit)
        scene.addSubview(fifthDigit)
        scene.addSubview(sixthDigit)
        scene.addSubview(sendLetterButton)
        scene.addSubview(pickerView)
        scene.addSubview(timerLabel)
        
        self.view = scene
    }
    
    override func viewDidLoad() {
        //Set constraints
        circuitImage.translatesAutoresizingMaskIntoConstraints = false
        circuitImage.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        circuitImage.centerYAnchor.constraint(equalTo: scene.centerYAnchor, constant: 20).isActive = true
        circuitImage.widthAnchor.constraint(equalToConstant:   400).isActive = true
        circuitImage.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: circuitImage.bottomAnchor, constant: -150).isActive = true
        pickerView.leftAnchor.constraint(equalTo: circuitImage.leftAnchor, constant: 70).isActive = true
        pickerView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        answerScreen.translatesAutoresizingMaskIntoConstraints = false
        answerScreen.centerXAnchor.constraint(equalTo: scene.centerXAnchor).isActive = true
        answerScreen.bottomAnchor.constraint(equalTo: circuitImage.topAnchor, constant:  -60).isActive = true
        
        answerScreenBackground.translatesAutoresizingMaskIntoConstraints = false
        answerScreenBackground.centerXAnchor.constraint(equalTo: answerScreen.centerXAnchor).isActive = true
        answerScreenBackground.centerYAnchor.constraint(equalTo: answerScreen.centerYAnchor, constant: -5).isActive = true
        answerScreenBackground.widthAnchor.constraint(equalToConstant: answerScreen.frame.width).isActive = true
        answerScreenBackground.heightAnchor.constraint(equalToConstant: answerScreen.frame.height+10).isActive = true
        
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.rightAnchor.constraint(equalTo: answerLabel.leftAnchor, constant: -20).isActive = true
        timerLabel.centerYAnchor.constraint(equalTo: answerScreen.centerYAnchor).isActive = true
        
        display.translatesAutoresizingMaskIntoConstraints = false
        display.centerXAnchor.constraint(equalTo: circuitImage.centerXAnchor, constant: 100).isActive = true
        display.centerYAnchor.constraint(equalTo: circuitImage.centerYAnchor, constant: -display.frame.height/2).isActive = true
        
        firstDigit.translatesAutoresizingMaskIntoConstraints = false
        firstDigit.rightAnchor.constraint(equalTo: circuitImage.leftAnchor, constant: 10).isActive = true
        firstDigit.topAnchor.constraint(equalTo: circuitImage.topAnchor, constant: -5).isActive = true
        firstDigit.widthAnchor.constraint(equalToConstant:   50).isActive = true
        firstDigit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondDigit.translatesAutoresizingMaskIntoConstraints = false
        secondDigit.rightAnchor.constraint(equalTo: circuitImage.leftAnchor, constant: 10).isActive = true
        secondDigit.topAnchor.constraint(equalTo: circuitImage.topAnchor, constant: 35).isActive = true
        secondDigit.widthAnchor.constraint(equalToConstant:   50).isActive = true
        secondDigit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        thirdDigit.translatesAutoresizingMaskIntoConstraints = false
        thirdDigit.rightAnchor.constraint(equalTo: circuitImage.leftAnchor, constant: 10).isActive = true
        thirdDigit.topAnchor.constraint(equalTo: circuitImage.topAnchor, constant: 75).isActive = true
        thirdDigit.widthAnchor.constraint(equalToConstant:   50).isActive = true
        thirdDigit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        fourthDigit.translatesAutoresizingMaskIntoConstraints = false
        fourthDigit.rightAnchor.constraint(equalTo: circuitImage.leftAnchor, constant: 10).isActive = true
        fourthDigit.topAnchor.constraint(equalTo: circuitImage.topAnchor, constant: 110).isActive = true
        fourthDigit.widthAnchor.constraint(equalToConstant:   50).isActive = true
        fourthDigit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        fifthDigit.translatesAutoresizingMaskIntoConstraints = false
        fifthDigit.rightAnchor.constraint(equalTo: circuitImage.leftAnchor, constant: 10).isActive = true
        fifthDigit.topAnchor.constraint(equalTo: circuitImage.topAnchor, constant: 150).isActive = true
        fifthDigit.widthAnchor.constraint(equalToConstant:   50).isActive = true
        fifthDigit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        sixthDigit.translatesAutoresizingMaskIntoConstraints = false
        sixthDigit.rightAnchor.constraint(equalTo: circuitImage.leftAnchor, constant: 10).isActive = true
        sixthDigit.topAnchor.constraint(equalTo: circuitImage.topAnchor, constant: 190).isActive = true
        sixthDigit.widthAnchor.constraint(equalToConstant:   50).isActive = true
        sixthDigit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        sendLetterButton.translatesAutoresizingMaskIntoConstraints = false
        sendLetterButton.centerXAnchor.constraint(equalTo: display.centerXAnchor, constant: 60).isActive = true
        sendLetterButton.topAnchor.constraint(equalTo: display.topAnchor, constant: display.frame.height + 5).isActive = true
        sendLetterButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        sendLetterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        sendLetterButton.layer.borderWidth = 8
        sendLetterButton.layer.cornerRadius = 10
        
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerXAnchor.constraint(equalTo: answerScreen.centerXAnchor).isActive = true
        answerLabel.centerYAnchor.constraint(equalTo: answerScreen.centerYAnchor).isActive = true
        answerLabel.widthAnchor.constraint(equalToConstant: answerScreen.frame.width).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: answerScreen.frame.height).isActive = true
    }
    
    @objc func changeState(_ sender: UIButton){
        //Change state of a button
        if(sender.titleLabel?.text == "0"){
            sender.setTitle("1", for: .normal)
        }
        else{
            sender.setTitle("0", for: .normal)
        }
        //Create code input based on button title Label
        let codeInput = (firstDigit.titleLabel?.text)! + (secondDigit.titleLabel?.text)! + (thirdDigit.titleLabel?.text)! + (fourthDigit.titleLabel?.text)! + (fifthDigit.titleLabel?.text)! + (sixthDigit.titleLabel?.text)!
        
        //Set the correct symbol on pickerView based on code input
        pickerView.selectRow(getPositionInPicker(codeInput: codeInput), inComponent: 0, animated: true)
        //Set the correct symbol on display based on code input
        display.getOutputCodeFromInputCode(codeInput: codeInput)
    }
    
    @objc func tryAgain(){
        //Reset the timer and get ready to restart game
        sendLetterButton.layer.removeAllAnimations()
        timerCount = 90
        currentLetterAnswer = ""
        answerLabel.textColor = UIColor.black
        answerLabel.text = "WELCOME TO\n ------"
        sendLetterButton.setTitle("Send Letter", for: .normal)
        sendLetterButton.removeTarget(self, action: #selector(self.tryAgain), for: .touchUpInside)
        sendLetterButton.addTarget(self, action: #selector(sendAnswer), for: .touchUpInside)
    }
    
    func getPositionInPicker(codeInput: String) -> Int{
        //Get the index of symbol based on code Input
        guard let index = symbolsArray.firstIndex(of: display.getLetterFromCode(codeInput: codeInput)) else { return 0 }
        return index
    }
    
    @objc func sendAnswer(){
        //Add the letter chose to currentLetterAnswer
        currentLetterAnswer += display.getCurrentLetter()
        
        //If letter is right, remove "-" and replace with correct letter
        if(answer.prefix(currentLetterAnswer.count) == currentLetterAnswer){
            let index = answerLabel.text?.firstIndex(of: "-")
            answerLabel.text = "\(answerLabel.text!.replacingOccurrences(of: "-", with: ""))\(answerLabel.text!.replacingCharacters(in: ...index!, with: display.getCurrentLetter()) )"
        }
            //Else remove letter from currentLetterAnswer and do shake animation
        else{
            currentLetterAnswer.remove(at: currentLetterAnswer.index(before: currentLetterAnswer.endIndex))
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear,
                           animations: {
                            self.sendLetterButton.layer.position.x += 10
            },
                           completion: nil)
            
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear,
                           animations: {
                            self.sendLetterButton.layer.position.x -= 20
            },
                           completion: nil)
            
            UIView.animate(withDuration: 0.1, delay: 0.2, options: .curveLinear,
                           animations: {
                            self.sendLetterButton.layer.position.x += 10
            },
                           completion:  nil)
        }
        //Check if user wins
        if(currentLetterAnswer == answer){
            timerCount = -1
            sendLetterButton.setTitle("Play Again", for: .normal)
            answerLabel.text = "MISSION\nCOMPLETE!"
            answerLabel.textColor = UIColor.green
            sendLetterButton.removeTarget(self, action: #selector(self.sendAnswer), for: .touchUpInside)
            sendLetterButton.addTarget(self, action: #selector(self.tryAgain), for: .touchUpInside)
        }
    }
}



class sevenSegmentDisplay: UIView{
    
    var segments: [Segment] = [Segment()]
    var inputDictionary: Dictionary<String, String> = [:]
    var letterCodeInput: Dictionary<String, String> = [:]
    var currentLetter = ""
    var backgroundDisplayImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //Set the default dimension of display
        self.frame = CGRect(x: 100, y: 100, width: 120, height: 220)
        createDisplay()
        setDictionary()
        getOutputCodeFromInputCode(codeInput: "100101")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Get the an array containing all the symbols in the dictionary
    func getSymbolInDictionary() -> [String]{
        var array: [String] = []
        for symbol in letterCodeInput{
            array.append(symbol.value)
        }
        
        return array
    }
    
    //Set dictionary of encoding (in letter and code translation)
    func setDictionary(){
        //A
        inputDictionary["000001"] = "11101100011000"
        letterCodeInput["000001"] = "A"
        //B
        inputDictionary["000010"] = "11110001001010"
        letterCodeInput["000010"] = "B"
        //C
        inputDictionary["000011"] = "10011100000000"
        letterCodeInput["000011"] = "C"
        //D
        inputDictionary["000100"] = "11110001000010"
        letterCodeInput["000100"] = "D"
        //E
        inputDictionary["000101"] = "10011100010000"
        letterCodeInput["000101"] = "E"
        //F
        inputDictionary["000110"] = "10001100010000"
        letterCodeInput["000110"] = "F"
        //G
        inputDictionary["000111"] = "10111100001000"
        letterCodeInput["000111"] = "G"
        //H
        inputDictionary["001000"] = "01101100011000"
        letterCodeInput["001000"] = "H"
        //I
        inputDictionary["001001"] = "10010001000010"
        letterCodeInput["001001"] = "I"
        //J
        inputDictionary["001010"] = "01111000000000"
        letterCodeInput["001010"] = "J"
        //K
        inputDictionary["001011"] = "00001100110001"
        letterCodeInput["001011"] = "K"
        //L
        inputDictionary["001100"] = "00011100000000"
        letterCodeInput["001100"] = "L"
        //M
        inputDictionary["001101"] = "01101110100000"
        letterCodeInput["001101"] = "M"
        //N
        inputDictionary["001110"] = "01101110000001"
        letterCodeInput["001110"] = "N"
        //O
        inputDictionary["001111"] = "11111100000000"
        letterCodeInput["001111"] = "O"
        //P
        inputDictionary["010000"] = "11001100011000"
        letterCodeInput["010000"] = "P"
        //Q
        inputDictionary["010001"] = "11111100000001"
        letterCodeInput["010001"] = "Q"
        //R
        inputDictionary["010010"] = "11001100011001"
        letterCodeInput["010010"] = "R"
        //S
        inputDictionary["010011"] = "10010100010001"
        letterCodeInput["010011"] = "S"
        //T
        inputDictionary["010100"] = "10000001000010"
        letterCodeInput["010100"] = "T"
        //U
        inputDictionary["010101"] = "01111100000000"
        letterCodeInput["010101"] = "U"
        //V
        inputDictionary["010110"] = "00001100100100"
        letterCodeInput["010110"] = "V"
        //W
        inputDictionary["010111"] = "01101100000101"
        letterCodeInput["010111"] = "W"
        //X
        inputDictionary["011000"] = "00000010100101"
        letterCodeInput["011000"] = "X"
        //Y
        inputDictionary["011001"] = "01110100011000"
        letterCodeInput["011001"] = "Y"
        //Z
        inputDictionary["011010"] = "10010000100100"
        letterCodeInput["011010"] = "Z"
        //0
        inputDictionary["011011"] = "11111100100100"
        letterCodeInput["011011"] = "0"
        //1
        inputDictionary["011100"] = "01100000100000"
        letterCodeInput["011100"] = "1"
        //2
        inputDictionary["011101"] = "11011000011000"
        letterCodeInput["011101"] = "2"
        //3
        inputDictionary["011110"] = "11110000001000"
        letterCodeInput["011110"] = "3"
        //4
        inputDictionary["011111"] = "01100100011000"
        letterCodeInput["011111"] = "4"
        //5
        inputDictionary["100000"] = "10110100011000"
        letterCodeInput["100000"] = "5"
        //6
        inputDictionary["100001"] = "10111100011000"
        letterCodeInput["100001"] = "6"
        //7
        inputDictionary["100010"] = "11100000000000"
        letterCodeInput["100010"] = "7"
        //8
        inputDictionary["100011"] = "11111100011000"
        letterCodeInput["100011"] = "8"
        //9
        inputDictionary["100100"] = "11110100011000"
        letterCodeInput["100100"] = "9"
        //-
        inputDictionary["111111"] = "00000000011000"
        letterCodeInput["111111"] = "-"
    }
    
    //Found letter from input code
    func getLetterFromCode(codeInput: String) -> String{
        var letter = ""
        
        for (key, value) in letterCodeInput{
            if(codeInput == key){
                letter = value
            }
        }
        return letter
    }
    
    //Find input code from letter
    func getInputCode(letter: String) -> String{
        var codeInput = ""
        
        for (key, value) in letterCodeInput{
            if(letter == value){
                codeInput = key
            }
        }
        return codeInput
    }
    
    //Found the output code based on an input Code
    func getOutputCodeFromInputCode(codeInput: String){
        setDisplay(inputCode: inputDictionary[codeInput] ?? "00000000011000")
        currentLetter = letterCodeInput[codeInput] ?? "-"
    }
    
    func getCurrentLetter() -> String{
        //Get the letter selected on the display
        return currentLetter
    }
    
    func createDisplay(){
        //Create segments
        //A
        segments.append(Segment(frame: CGRect(x: 25, y: 10, width: 70, height: 20)))
        //B
        segments.append(Segment(frame: CGRect(x: 90, y: 25, width: 20, height: 80)))
        //C
        segments.append(Segment(frame: CGRect(x: 90, y: 115, width: 20, height: 80)))
        //D
        segments.append(Segment(frame: CGRect(x: 25, y: 190, width: 70, height: 20)))
        //E
        segments.append(Segment(frame: CGRect(x: 10, y: 115, width: 20, height: 80)))
        //F
        segments.append(Segment(frame: CGRect(x: 10, y: 25, width: 20, height: 80)))
        //G
        segments.append(Segment(frame: CGRect(x: 36, y: 35, width: 10, height: 60)))
        segments.last?.transform = CGAffineTransform.init(rotationAngle: -CGFloat.pi/14)
        //H
        segments.append(Segment(frame: CGRect(x: 53, y: 30, width: 15, height: 75)))
        //I
        segments.append(Segment(frame: CGRect(x: 74, y: 35, width: 10, height: 60)))
        segments.last?.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/14)
        //L
        segments.append(Segment(frame: CGRect(x: 20, y: 103, width: 40, height: 15)))
        //M
        segments.append(Segment(frame: CGRect(x: 65, y: 103, width: 40, height: 15)))
        //N
        segments.append(Segment(frame: CGRect(x: 36, y: 125, width: 10, height: 65)))
        segments.last?.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/14)
        //O
        segments.append(Segment(frame: CGRect(x: 53, y: 115, width: 15, height: 75)))
        //P
        segments.append(Segment(frame: CGRect(x: 74, y: 125, width: 10, height: 65)))
        segments.last?.transform = CGAffineTransform.init(rotationAngle: -CGFloat.pi/14)
        
        //Add segments to display
        for segment in segments{
            self.addSubview(segment)
        }
        
        //Set background of display
        backgroundDisplayImage.frame = self.bounds
        backgroundDisplayImage.image = UIImage(named: "fourtheenSegmentDisplayBackground")
        backgroundDisplayImage.contentMode = .scaleAspectFill
        backgroundDisplayImage.clipsToBounds = true
        
        self.addSubview(backgroundDisplayImage)
        self.sendSubviewToBack(backgroundDisplayImage)
    }
    
    func setDisplay(inputCode: String){
        //Set the output of display based on the input Code
        for (index, character) in inputCode.enumerated(){
            //Red if 1
            if(character == "1"){
                segments[index + 1].innerColor = .red
                segments[index + 1].alpha = 1
            }
                //Black if 0
            else{
                segments[index + 1].innerColor = .black
                segments[index + 1].alpha = 0.5
            }
        }
    }
}

// UIView to draw segment of display
class Segment: UIView {
    
    enum Orientation {
        case horizontal
        case vertical
        case null
    }
    
    // Main color. Defaults to red.
    var innerColor: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // Outline color . Defaults to white.
    var outerColor: UIColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //'thickness' of the segment is
    private var thick: CGFloat = 5.0
    
    //Length of the segment
    private var length: CGFloat = 25.0
    
    //Create corner for each segment
    private var cutoff: CGFloat { return length/10 }
    
    //The width outline
    private var strokeWidth: CGFloat { return thick/10 }
    
    //Indicates which dimension is longer, horizontal or vertical
    private var orientation: Orientation
    
    override init(frame: CGRect) {
        let h = frame.size.height
        let w = frame.size.width
        
        orientation = w > h ? .horizontal : .vertical
        switch orientation {
        case .horizontal:
            length = w
            thick = h
        case .vertical:
            length = h
            thick = w
        default:
            length = w
            thick = h
        }
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        orientation = .null
        
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        
        let h = self.frame.size.height
        let w = self.frame.size.width
        
        orientation = w > h ? .horizontal : .vertical
        switch orientation {
        case .horizontal:
            length = w
            thick = h
        case .vertical:
            length = h
            thick = w
        default:
            length = w
            thick = h
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        // Set up the stroke/fill color and stroke width.
        context?.setStrokeColor(outerColor.cgColor)
        context?.setLineWidth(strokeWidth)
        context?.setFillColor(innerColor.cgColor)
        
        // Create an offset prevent drawing outside the rect.
        let offset = strokeWidth/2
        
        switch orientation {
        case .horizontal:
            context?.move(to: CGPoint(x: cutoff, y: offset))
            context?.addLine(to: CGPoint(x: length - cutoff, y: offset))
            context?.addLine(to: CGPoint(x: length - offset, y: thick/2))
            context?.addLine(to: CGPoint(x: length - cutoff, y: thick - offset))
            context?.addLine(to: CGPoint(x: cutoff, y: thick - offset))
            context?.addLine(to: CGPoint(x: offset, y: thick/2))
            
        case .vertical:
            context?.move(to: CGPoint(x: offset, y: cutoff))
            context?.addLine(to: CGPoint(x: offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: thick/2, y: length - offset))
            context?.addLine(to: CGPoint(x: thick - offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: thick - offset, y: cutoff))
            context?.addLine(to: CGPoint(x: thick/2, y: offset))
            
        default:
            break
        }
        
        context?.closePath()
        context?.drawPath(using: .fillStroke)
    }
    
    override var description: String {
        return "\(orientation) > (\(thick), \(length))"
    }
}


//Set the scene
let thirdView = ThirdScene()
thirdView.preferredContentSize = CGSize(width: 512, height: 384)
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundSupport.PlaygroundPage.current.liveView = thirdView
//#-end-hidden-code
