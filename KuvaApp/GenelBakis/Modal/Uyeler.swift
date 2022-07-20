//
//  Uyeler.swift
//  KuvaApp
//
//  Created by Yunus Gündüz on 20.07.2022.
//

import Foundation
import UIKit

class Uyeler: Codable {
    var kisi_id: String?
    var user_name: String?
    
    init (kisi_id:String,user_name:String){
        self.kisi_id=kisi_id
        self.user_name = user_name
    }
}
