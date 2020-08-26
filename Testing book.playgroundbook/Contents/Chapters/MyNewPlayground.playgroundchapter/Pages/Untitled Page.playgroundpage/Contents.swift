//#-hidden-code
import UIKit
//#-end-hidden-code
import UIKit
import PlaygroundSupport

class FirstScene: UIViewController {
  
    var label = UILabel()
        
    override func loadView() {
       
        let scene = UIView()
        scene.backgroundColor = .yellow
        
        label = UILabel(frame: CGRect(x: 20, y: 20, width: 402, height: 40))
        label.text = "spento"
        label.textColor = .red
        
        let immagine = UIImageView(frame: CGRect(x: 60, y: 160, width: 250, height: 250))
        immagine.image = UIImage(named: "transistor")
        
        let bottone = UIButton(frame: CGRect(x: 80, y: 80, width: 60, height: 60))
        bottone.setTitle("Prova", for: .normal)
        bottone.setTitleColor(.black, for: .normal)
        bottone.setTitleColor(.red, for: .highlighted)
        bottone.addTarget(self, action: #selector(self.clicca), for: .touchDown)
        bottone.addTarget(self, action: #selector(self.cliccano), for: .touchUpInside)
        scene.addSubview(bottone)
        scene.addSubview(label)
        scene.addSubview(immagine)
        
        
        self.view = scene
    }
    
    @objc func clicca(){
        label.text = "acceso"
    }
    
    @objc func cliccano(){
        label.text = "spento"
    }
}
//Set the scene
PlaygroundSupport.PlaygroundPage.current.liveView = FirstScene()
