//
//  ViewController.swift
//  KuvaApp
//
//  Created by Yunus Gündüz on 10.07.2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    var username:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func btnGrsYap(_ sender: Any) {
        if  username == "ynsgndz"{
            performSegue(withIdentifier: "loginToMain", sender: nil)
        }
        //
        bilgiCekme()
    }
    
    func bilgiCekme(){
        let username = usernameTextField.text!
        let url = URL(string: "http://yunusgunduz.site/public/api/\(username)")
        let session  = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        as? Dictionary<String, Any>
                        DispatchQueue.main.async {
                           
                            print(jsonResponse ?? "error var")
                            
                         
                            
                                self.username = jsonResponse!["username"] as! String
                          
                                
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
      
    }
        
        
    }
    


