//
//  userBilgileri.swift
//  KuvaApp
//
//  Created by Yunus Gündüz on 20.07.2022.
//

import Foundation

class UserBilgileri{
    
    
    public var userid:Int;
    public var userName:String;
    public var userEmail:String;
    
    public var userRace:String;
    public var userlevel:Int;
    
    public var userBattleValue:Int;
   
    public var usergold:Double;
    public var userexp:Double;
    public var userhp_now:Int;
    
    public var userstat_battle:Int;
    public var userstat_win:Int;
    public var userstat_loss:Int;
    public var userstat_draw:Int;
    
    public var userab_pow:Int;
    public var userab_def:Int;
    
    init(userName:String,userEmail:String,userRace:String,userlevel:Int,userBattleValue:Int,usergold:Double,userexp:Double,userhp_now:Int,
         userstat_battle:Int, userstat_win:Int,userstat_loss:Int,userstat_draw:Int,
         userab_pow:Int,userab_def:Int,userid:Int){
        self.userid = userid
        self.userName = userName
        self.userEmail = userEmail
        self.userRace = userRace
        self.userlevel=userlevel
        self.userBattleValue=userBattleValue
        self.usergold=usergold
        self.userexp=userexp
        self.userhp_now=userhp_now
        self.userstat_battle=userstat_battle
        self.userstat_win=userstat_win
        self.userstat_loss=userstat_loss
        self.userstat_draw=userstat_draw
        self.userab_pow=userab_pow
        self.userab_def=userab_def
        
        
        
    }
    
    
}


