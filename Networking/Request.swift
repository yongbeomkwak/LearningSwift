//
//  Request.swift
//  Networking
//
//  Created by yongbeomkwak on 2022/07/11.
//

import Foundation


let DidReceiveFriendsNotification: Notification.Name = Notification.Name("DidRecieveFriends") //알림 식별 태그

func requestFriend() {
    guard let url:URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {return}
    
    let session: URLSession = URLSession(configuration: .default) //세션 만들고
    
    //데이터 테스크를 만듬
    let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error:Error?) in
        
        
        //요청이 왔을 때 핸들러 함수
        if let error = error {
            print("First Error")
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else {return}
        
        
        do {
            let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            //post(name:object:userInfo:) : 지정된 이름, 보낸 객체, 보낼 정보로 노티피케이션을 만들어 노티피케이션 센터에 발송합니다.
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil,userInfo:["friends": apiResponse.results])
            
           
        } catch(let err){
            
            print(err.localizedDescription)
        }
    }
    
    dataTask.resume()//요청 시도
}
