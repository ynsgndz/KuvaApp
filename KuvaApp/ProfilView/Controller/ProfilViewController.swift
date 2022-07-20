//
//  ProfilViewController.swift
//  KuvaApp
//
//  Created by Yunus Gündüz on 10.07.2022.
//

import UIKit

class ProfilViewController: UIViewController {

    @IBOutlet weak var labelProfilDetayli: UILabel!
    @IBOutlet weak var labelProfilDetayli2: UILabel!
    @IBOutlet weak var labelProfilDetayli3: UILabel!
    @IBOutlet weak var labelProfilDetayli4: UILabel!
    @IBOutlet weak var labelProfilDetayli5: UILabel!
    @IBOutlet weak var labelProfilDetayli6: UILabel!
    @IBOutlet weak var labelProfilDetayli7: UILabel!
    @IBOutlet weak var labelProfilDetayli8: UILabel!
    @IBOutlet weak var labelProfilDetayli9: UILabel!
    @IBOutlet weak var labelProfilDetayli10: UILabel!
    @IBOutlet weak var labelProfilDetayli11: UILabel!
    @IBOutlet weak var labelProfilDetayli12: UILabel!
    @IBOutlet weak var labelProfilDetayli13: UILabel!
    @IBOutlet weak var labelProfilDetayli14: UILabel!
    
    
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
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://yunusgunduz.site/public/api/1")
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
                            
                           
                            labelProfilDetayli.text="Irk : \(userRace)"
                            labelProfilDetayli2.text="ID: \(userid)"
                            labelProfilDetayli3.text="Adi: \(userName)"
                            labelProfilDetayli4.text="Kademe: \(userlevel)"
                            labelProfilDetayli5.text="Saldiri Gücü: \(userBattleValue)"
                            labelProfilDetayli6.text="Güç: \(userab_pow)"
                            labelProfilDetayli7.text="Savunma: \(userab_def)"
                            labelProfilDetayli8.text="Tecrube: \(userexp)"
                            labelProfilDetayli9.text="Yaşam Gücü: \(userhp_now)"
                            labelProfilDetayli10.text="Altın: \(usergold)"
                            labelProfilDetayli11.text="Toplam Savaş: \(userstat_battle)"
                            labelProfilDetayli12.text="Galibiyet: \(userstat_win)"
                            labelProfilDetayli13.text="Yenilgi: \(userstat_loss)"
                            labelProfilDetayli14.text="Beraberlik: \(userstat_loss)"
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.resume()
        
        
        
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
