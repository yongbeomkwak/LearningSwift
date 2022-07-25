//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by yongbeomkwak on 2022/07/25.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class RandomUserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var randomusers = [RandomUser] ()
    
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init()
    {
        print(#fileID,#function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers()
    {
        print(#fileID,#function,#line, "")
              
              AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{$0.value} // Value로 옵셔널을 Unwrapping
            .map{$0.results} //results만 가져옴
            .sink {completion in
               
                switch completion{
                case .finished:
                    print("데이터 스트림 완료")
                
                case.failure(let err):
                    print("Error : \(err)")
                }
            } receiveValue: {  [weak self] (receivedValue: [RandomUser]) in
                guard let self = self else {return}
                print("받은 값: \(receivedValue.count)")
                self.randomusers = receivedValue
            }.store(in: &subscription)

    }
    
}
