//
//  ContentView.swift
//  LearningKingfisher
//
//  Created by yongbeomkwak on 2022/07/26.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    let url:URL = URL(string: "https://randomuser.me/api/portraits/men/50.jpg")!
    
    
    var  resource: Resource {
        ImageResource(downloadURL: self.url, cacheKey: "my_cache_key")
    }
    
    var body: some View {
        VStack{
//            KFImage(url)
//                .placeholder { //플레이스 홀더 설정
//                    Image(systemName: "list.dash")
//                }.retry(maxCount: 3, interval: .seconds(5)) //재시도
//                .onSuccess {r in //성공
//                    print("succes: \(r)")
//                }
//                .onFailure { e in //실패
//                    print("failure: \(e)")
//                }
//                .resizable()
//                .frame(width: 128, height: 128) //resize
//                .cornerRadius(20) //둥근 코너 설정
//                .shadow(radius: 5) // 그림자 설정
            
            
                
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
