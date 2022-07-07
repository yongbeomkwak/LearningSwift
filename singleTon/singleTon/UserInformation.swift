//
//  UserInformation.swift
//  singleTon
//
//  Created by yongbeomkwak on 2022/07/07.
//

import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation()
    
    
    var name:String?
    var age:String?
}
