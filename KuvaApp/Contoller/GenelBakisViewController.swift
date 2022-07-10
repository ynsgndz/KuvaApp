//
//  GenelBakisViewController.swift
//  KuvaApp
//
//  Created by Yunus Gündüz on 10.07.2022.
//

import UIKit

class GenelBakisViewController: UIViewController {

    @IBOutlet weak var sgmntdControl: UISegmentedControl!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFor: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SCchanged(_ sender: Any) {
        if(sgmntdControl.selectedSegmentIndex==0){
            //KarakterKismi
            labelOne.text="Irk : Savaşçı"
            labelTwo.text="ID: 0001"
            labelThree.text="Adi: Ynsgndz"
            labelFor.text="Kademe: 1"
            labelFive.text="Saldiri Gücü: 11"
        }
        if(sgmntdControl.selectedSegmentIndex==1){
            //OzelliklerKismi
            labelOne.text="Güç: 5"
            labelTwo.text="Savunma: 5"
            labelThree.text="Tecrube: 5"
            labelFor.text="Yaşam Gücü: 100"
            labelFive.text=""
        }
        if(sgmntdControl.selectedSegmentIndex==2){
            //IstatistiklerKismi
            labelOne.text="Altın: 100"
            labelTwo.text="Toplam Savaş: 4"
            labelThree.text="Galibiyet: 3"
            labelFor.text="Yenilgi: 1"
            labelFive.text="Beraberlik: 0"
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
