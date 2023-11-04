//
//  ViewController.swift
//  FaceRecognition
//
//  Created by ismail harmanda on 4.11.2023.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func navigate(){
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    
    
    @IBAction func onPressSignIn(_ sender: UIButton) {
        print("test")
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                
                if success == true{
                    DispatchQueue.main.async{
                        self.navigate()
                    }
                } else {
                    DispatchQueue.main.async{
                        self.label.text = error?.localizedDescription
                    }
                  
                }
            }
        }
    }
    

}

