//
//  GenelBakisViewController.swift
//  KuvaApp
//
//  Created by Yunus Gündüz on 10.07.2022.
//

import UIKit

class GenelBakisViewController: UIViewController {

    @IBOutlet weak var sgmntdControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFor: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    
    public var userid:Int = 0;
    public var userName:String = "";
    public var userEmail:String = "";
    public var userPassword:String = "";
    public var userRace:String = "";
    public var userlevel:String = "";
    
    public var userBattleValue:String = "";
   
    public var usergold:String = "";
    public var userexp:String = "";
    public var userhp_now:String = "";
    
    public var userstat_battle:String = "";
    public var userstat_win:String = "";
    public var userstat_loss:String = "";
    public var userstat_draw:String = "";
    
    public var userab_pow:String = "";
    public var userab_def:String = "";
    

 
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(false)
        print(defaults.bool(forKey: "userDefauldIsLogin"))
        if (defaults.bool(forKey: "userDefauldIsLogin")){
            
        }else{
            self.performSegue(withIdentifier: "genelToLogin", sender: nil)
        }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Debug: userDefauldID : \(self.defaults.string(forKey: "userDefauldID")!)")
        print("Debug: userDefauldIsLogin : \(self.defaults.bool(forKey: "userDefauldIsLogin"))")
        
            var userDefID = defaults.object(forKey: "userDefauldID")
        let url = URL(string: "http://yunusgunduz.site/public/api/\(userDefID!)")
        let session  = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        as? Dictionary<String, Any>
                        DispatchQueue.main.async { [self] in
                           
                            print(jsonResponse ?? "error var")
                            
                            userid = jsonResponse!["id"] as? Int ?? 00
                            userName = jsonResponse!["username"] as? String ?? "None"
                            userEmail = jsonResponse!["email"] as? String ?? "None"
                          
                            if (jsonResponse!["race"]  as? String == "w"){
                                userRace = "Warrior"
                            }
                            if (jsonResponse!["race"]  as? String == "z"){
                                userRace = "Zombie"
                            }
                            if (jsonResponse!["race"]  as? String == "m"){
                                userRace = "Mage"
                            }
                            if (jsonResponse!["race"]  as? String == "0"){
                                userRace = "ZeroMan"
                            }
                            if (jsonResponse!["race"]  as? String == "1"){
                                userRace = "Elf"
                            }
                            userlevel = jsonResponse!["level"]  as? String ?? "None"
                            userBattleValue = jsonResponse!["battle_value"]  as? String ?? "None"
                            usergold = jsonResponse!["gold"] as? String ?? "None"
                            userexp = jsonResponse!["exp"]  as? String ?? "None"
                            userhp_now = jsonResponse!["hp_now"]  as? String ?? "None"
                            userstat_battle = jsonResponse!["stat_battle"]  as? String ?? "None"
                            userstat_win = jsonResponse!["stat_win"] as? String ?? "None"
                            userstat_loss = jsonResponse!["stat_loss"]  as? String ?? "None"
                            userstat_draw = jsonResponse!["stat_draw"]  as? String ?? "None"
                            userab_pow = jsonResponse!["ab_pow"]  as? String ?? "None"
                            userab_def = jsonResponse!["ab_def"]  as? String ?? "None"
                            
                            print("Debug: type of \(type(of: jsonResponse!["level"]!) )")
                            
                            self.labelOne.text="Irk : \(userRace)"
                           self.labelTwo.text="ID: \(userid)"
                            self.labelThree.text="Adi: \(userName)"
                            self.labelFor.text="Kademe: \(userlevel)"
                            self.labelFive.text="Saldiri Gücü: \(userBattleValue)"
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
    }
    @IBAction func SCchanged(_ sender: Any) {
        if(sgmntdControl.selectedSegmentIndex==0){
            //KarakterKismi
           
            self.labelOne.text="Irk : \(userRace)"
           self.labelTwo.text="ID: \(userid)"
            self.labelThree.text="Adi: \(userName)"
            self.labelFor.text="Kademe: \(userlevel)"
            self.labelFive.text="Saldiri Gücü: \(userBattleValue)"
        }
        if(sgmntdControl.selectedSegmentIndex==1){
            //OzelliklerKismi
            labelOne.text="Güç: \(userab_pow)"
            labelTwo.text="Savunma: \(userab_def)"
            labelThree.text="Tecrube: \(userexp)"
            labelFor.text="Yaşam Gücü: \(userhp_now)"
            labelFive.text=""
        }
        if(sgmntdControl.selectedSegmentIndex==2){
            //IstatistiklerKismi
            labelOne.text="Altın: \(usergold)"
            labelTwo.text="Toplam Savaş: \(userstat_battle)"
            labelThree.text="Galibiyet: \(userstat_win)"
            labelFor.text="Yenilgi: \(userstat_loss)"
            labelFive.text="Beraberlik: \(userstat_draw)"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
