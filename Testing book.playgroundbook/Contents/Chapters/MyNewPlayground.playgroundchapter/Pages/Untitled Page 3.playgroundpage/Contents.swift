//#-hidden-code
import UIKit
//#-end-hidden-code

//: [Previous](@previous)
import UIKit
import PlaygroundSupport

class ThirdScene: UIViewController {
    
    
    
    
    var display = sevenSegmentDisplay()

    
    var button1 = UIButton()
    var button2 = UIButton()
    var sendAnswerButton = UIButton()
    var currentLetter = ""
    var userAnswer = ""
    var segmentF = Segment(frame: CGRect(x: 210, y: 200, width: 10, height: 60))
    var segmentA = Segment(frame: CGRect(x: 215, y: 195, width: 60, height: 10))
    var segmentB = Segment(frame: CGRect(x: 270, y: 200, width: 10, height: 60))
    var segmentL = Segment(frame: CGRect(x: 215, y: 255, width: 30, height: 10))
    var segmentM = Segment(frame: CGRect(x: 245, y: 255, width: 30, height: 10))
    var segmentE = Segment(frame: CGRect(x: 210, y: 260, width: 10, height: 60))
    var segmentC = Segment(frame: CGRect(x: 270, y: 260, width: 10, height: 60))
    var segmentD = Segment(frame: CGRect(x: 215, y: 315, width: 60, height: 10))
    var segmentN = Segment(frame: CGRect(x: 205, y: 290, width: 50, height: 10))
    var segmentP = Segment(frame: CGRect(x: 235, y: 290, width: 50, height: 10))
    var segmentO = Segment(frame: CGRect(x: 240, y: 265, width: 10, height: 50))
    var segmentG = Segment(frame: CGRect(x: 205, y: 220, width: 50, height: 10))
    var segmentI = Segment(frame: CGRect(x: 235, y: 220, width: 50, height: 10))
    var segmentH = Segment(frame: CGRect(x: 240, y: 205, width: 10, height: 50))
    
    override func loadView() {
          
        let scene = UIView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        scene.backgroundColor = .gray
        
        
        /*Set the scene
        let scene = GameScene(size: CGSize(width: 1024, height: 768))
        let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 384))
        //DEBUG
        //sceneView.showsFPS = true
        //sceneView.showsFields = true
        //sceneView.showsPhysics = true
        scene.scaleMode = .aspectFit
        sceneView.presentScene(scene)
        PlaygroundSupport.PlaygroundPage.current.liveView = sceneView*/
       
        display.frame = CGRect(x: 100, y: 100, width: display.frame.size.width, height: display.frame.size.height)
         
        //for segment in display.segments {
           // segment.fillColor = .black
       // }
        
        /*let immagine = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        immagine.image = UIImage(named: "ic")
        
        button1 = UIButton(frame: CGRect(x: 80, y: 118, width: 30, height: 30))
        button1.setTitle("1", for: .normal)
        button1.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        button2 = UIButton(frame: CGRect(x: 80, y: 150, width: 30, height: 30))
        button2.setTitle("1", for: .normal)
        button2.addTarget(self, action: #selector(self.changeState(_:)), for: .touchUpInside)
        
        sendAnswerButton = UIButton(frame: CGRect(x: 200, y: 100, width: 150, height: 90))
        sendAnswerButton.setTitle("Send Answer", for: .normal)
        sendAnswerButton.addTarget(self, action: #selector(self.sendAnswer), for: .touchUpInside)
        
        segmentN.transform = CGAffineTransform(rotationAngle: 90)
        segmentP.transform = CGAffineTransform(rotationAngle: -90)
        segmentG.transform = CGAffineTransform(rotationAngle: -90)
        segmentI.transform = CGAffineTransform(rotationAngle: 90)
        
        
        
        scene.addSubview(button1)
        scene.addSubview(button2)
        scene.addSubview(sendAnswerButton)
        scene.addSubview(segmentN)
        scene.addSubview(segmentP)
        scene.addSubview(segmentO)
        scene.addSubview(segmentG)
        scene.addSubview(segmentI)
        scene.addSubview(segmentH)
        scene.addSubview(segmentF)
        scene.addSubview(segmentA)
        scene.addSubview(segmentB)
        scene.addSubview(segmentL)
        scene.addSubview(segmentM)
        scene.addSubview(segmentE)
        scene.addSubview(segmentC)
        scene.addSubview(segmentD)
         scene.addSubview(immagine)*/
        
        scene.addSubview(display)
        self.view = scene
    }
    
   /* @objc func changeState(_ sender: UIButton){
        if(sender.titleLabel?.text == "0"){
            sender.setTitle("1", for: .normal)
        }
        else{
            sender.setTitle("0", for: .normal)
        }
        setOutput()
    }
    
    @objc func sendAnswer(){
        userAnswer += currentLetter
        
        checkAnswer()
    }
    
    func checkAnswer(){
        print(userAnswer)
    }
    
    func setOutput(){
        
        switch (button1.titleLabel!.text! + button2.titleLabel!.text!){
            case "11":
                    segmentA.fillColor = .red
                    segmentB.fillColor = .red
                    segmentC.fillColor = .red
                    segmentD.fillColor = .red
                    segmentE.fillColor = .black
                    segmentF.fillColor = .black
                    segmentG.fillColor = .black
                    segmentH.fillColor = .red
                    segmentI.fillColor = .black
                    segmentL.fillColor = .black
                    segmentM.fillColor = .black
                    segmentN.fillColor = .black
                    segmentO.fillColor = .red
                    segmentP.fillColor = .black
                    currentLetter = "D"
            case "00":
                    segmentA.fillColor = .black
                    segmentB.fillColor = .red
                    segmentC.fillColor = .red
                    segmentD.fillColor = .black
                    segmentE.fillColor = .red
                    segmentF.fillColor = .red
                    segmentG.fillColor = .black
                    segmentH.fillColor = .black
                    segmentI.fillColor = .black
                    segmentL.fillColor = .black
                    segmentM.fillColor = .black
                    segmentN.fillColor = .red
                    segmentO.fillColor = .black
                    segmentP.fillColor = .red
                    currentLetter = "W"
            case "01":
                    segmentA.fillColor = .red
                    segmentB.fillColor = .black
                    segmentC.fillColor = .black
                    segmentD.fillColor = .red
                    segmentE.fillColor = .red
                    segmentF.fillColor = .red
                    segmentG.fillColor = .black
                    segmentH.fillColor = .black
                    segmentI.fillColor = .black
                    segmentL.fillColor = .black
                    segmentM.fillColor = .black
                    segmentN.fillColor = .black
                    segmentO.fillColor = .black
                    segmentP.fillColor = .black
                    currentLetter = "C"
            case "10":
            segmentA.fillColor = .red
            segmentB.fillColor = .red
            segmentC.fillColor = .black
            segmentD.fillColor = .red
            segmentE.fillColor = .red
            segmentF.fillColor = .black
            segmentG.fillColor = .black
            segmentH.fillColor = .black
            segmentI.fillColor = .black
            segmentL.fillColor = .red
            segmentM.fillColor = .red
            segmentN.fillColor = .black
            segmentO.fillColor = .black
            segmentP.fillColor = .black
            currentLetter = "C"
            
        default:
            print("no")
        }
    }*/
}

class sevenSegmentDisplay: UIView{
    
    var segments: [Segment] = [Segment()]
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: layer.position.x, y: layer.position.y, width: 200, height: 200)
        self.backgroundColor = .blue
        createDisplay()
        setDisplay(inputCode: "1011001")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDisplay(){
        segments.append(Segment(frame: CGRect(x: 0, y: 0, width: self.frame.maxX/10, height: self.frame.maxY/4)))
        segments.append(Segment(frame: CGRect(x: 20, y: 10, width: self.frame.maxX/10, height: self.frame.maxY/4)))
        segments.append(Segment(frame: CGRect(x: 30, y: 20, width: self.frame.maxX/10, height: self.frame.maxY/4)))
        segments.append(Segment(frame: CGRect(x: 40, y: 30, width: self.frame.maxX/10, height: self.frame.maxY/4)))
        segments.append(Segment(frame: CGRect(x: 50, y: 40, width: self.frame.maxX/10, height: self.frame.maxY/4)))
        segments.append(Segment(frame: CGRect(x: 60, y: 50, width: self.frame.maxX/10, height: self.frame.maxY/4)))
        segments.append(Segment(frame: CGRect(x: 70, y: 60, width: self.frame.maxX/10, height: self.frame.maxY/4)))
        
        for segment in segments{
            self.addSubview(segment)
        }
    }
    
    func setDisplay(inputCode: String){
        
        for (indexSeg, segment) in segments.enumerated(){
            let index = inputCode.index(inputCode.startIndex, offsetBy: indexSeg)
            if(indexSeg <= 6){
                if(inputCode[index] == "0"){
                    segment.fillColor = .black
                }
                else{
                    segment.fillColor = .red
                }
            }
        }
    }
}

/// UIView subclass to draw one segment in a 7Segment display.
class Segment: UIView {
    
    enum Orientation {
        case horizontal
        case vertical
        case null
    }
    
    /// The dominant color of each segment. Defaults to red.
    var fillColor: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// The outline color of each segment. Defaults to white.
    var strokeColor: UIColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// How 'thick' the segment is. This is always the smaller value between length and breadth.
    private var breadth: CGFloat = 5.0
    
    /// Length of the segment. It is always the longer value between length and breadth.
    private var length: CGFloat = 25.0
    
    /// The side of triangle at each corner that is cutoff to give the 'tip' of the segment. Otherwise it is 1/15th of the length.
    private var cutoff: CGFloat { return length/10 }
    
    /// The width used to stroke the outline of each segment. It is always breadth/10.
    private var strokeWidth: CGFloat { return breadth/10 }
    
    /// Indicates whether the segment is "upright": vertical or "sideways": horizontal. This is ONLY to indicate which dimension is longer to help draw the segment.
    private var orientation: Orientation
    
    override init(frame: CGRect) {
        let h = frame.size.height
        let w = frame.size.width
        
        orientation = w > h ? .horizontal : .vertical
        switch orientation {
        case .horizontal:
            length = w
            breadth = h
        case .vertical:
            length = h
            breadth = w
        default:
            length = w
            breadth = h
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
            breadth = h
        case .vertical:
            length = h
            breadth = w
        default:
            length = w
            breadth = h
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        // Set up the stroke/fill color and stroke width.
        context?.setStrokeColor(strokeColor.cgColor)
        context?.setLineWidth(strokeWidth)
        context?.setFillColor(fillColor.cgColor)
        
        // Create an offset to account for the stroke thickness and prevent drawing outside the rect.
        let offset = strokeWidth/2
        
        switch orientation {
        case .horizontal:
            context?.move(to: CGPoint(x: cutoff, y: offset))
            context?.addLine(to: CGPoint(x: length - cutoff, y: offset))
            context?.addLine(to: CGPoint(x: length - offset, y: breadth/2))
            context?.addLine(to: CGPoint(x: length - cutoff, y: breadth - offset))
            context?.addLine(to: CGPoint(x: cutoff, y: breadth - offset))
            context?.addLine(to: CGPoint(x: offset, y: breadth/2))
            
        case .vertical:
            context?.move(to: CGPoint(x: offset, y: cutoff))
            context?.addLine(to: CGPoint(x: offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: breadth/2, y: length - offset))
            context?.addLine(to: CGPoint(x: breadth - offset, y: length - cutoff))
            context?.addLine(to: CGPoint(x: breadth - offset, y: cutoff))
            context?.addLine(to: CGPoint(x: breadth/2, y: offset))
            
        default:
            break
        }

        context?.closePath()
        context?.drawPath(using: .fillStroke)
    }
    
    override var description: String {
        return "\(orientation) > (\(breadth), \(length))"
    }
}


//Set the scene
PlaygroundSupport.PlaygroundPage.current.liveView = ThirdScene()
