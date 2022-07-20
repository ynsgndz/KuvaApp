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
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }

    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(false)
        print(defaults.bool(forKey: "userDefauldIsLogin"))
        print("Debug: username : \(self.defaults.string(forKey: "username")!)")
        if (defaults.bool(forKey: "userDefauldIsLogin")){
            self.performSegue(withIdentifier: "loginToMain", sender: nil)
            usernameTextField.text = self.defaults.string(forKey: "username")
        }else{
            usernameTextField.text = self.defaults.string(forKey: "username")
        }
       }
    
    @IBAction func btnGrsYap(_ sender: Any) {
      
        tryJsonCekme()
      //  bilgiCekme()
    }
    func tryJsonCekme(){
        print("Try")
     
        let url = URL(string: "http://yunusgunduz.site/public/api/")
        let session  = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        as? [Dictionary<String, Any>]
                        DispatchQueue.main.async { [self] in
                           
                           // print(jsonResponse!)
                            
                            for i in jsonResponse!{
                                
                             
                                    print(i["username"]!)
                                    if ((i["username"]! as! String) == self.usernameTextField.text) {
                                        self.defaults.set(true, forKey: "userDefauldIsLogin")
                                        self.defaults.set("\(i["id"]!)", forKey: "userDefauldID")
                                        self.defaults.set("\(i["username"]!)", forKey: "username")
                                        self.performSegue(withIdentifier: "loginToMain", sender: nil)
                                       
                                        print("Debug: userDefauldID : \(self.defaults.string(forKey: "userDefauldID")!)")
                                        print("Debug: userDefauldIsLogin : \(self.defaults.bool(forKey: "userDefauldIsLogin"))")
                                    }
                                    
                                 
                                    
                                 
                                
                            }
                            
                           
                            
                         
                           
                          
                                
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
    }
    
  
        
    }
    


