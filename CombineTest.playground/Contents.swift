import UIKit
import Combine

//var myIntArrayPublisher: Publishers.Sequence<[Int],Never> = [1,2,3].publisher
//
////[1,2,3]의 데이트를 갖는 publihser를 생성
//
//myIntArrayPublisher.sink { completion in
//
//
//    switch completion {
//    case.finished:
//        print("완료")
//
//    case .failure(let error):
//        print("실패: error : \(error)")
//    }
//
//} receiveValue: { value in
//    print("값을 받았습니다. : \(value)")
//}


var mySubscriptionSet = Set<AnyCancellable> () // Rx의 DisposeBag 같은느낌
//
//let myNotification = Notification.Name("com.Combine.test")
//var myDefaultPublisher = NotificationCenter.default.publisher(for: myNotification)
//
//myDefaultPublisher.sink { completion in
//
//    switch completion {
//    case .finished:
//        print("완료")
//
//    case .failure(let error):
//        print("실패 error :\(error)")
//    }
//
//} receiveValue: { value in
//    print("받은 값: \(value)")
//}.store(in: &mySubscriptionSet) // 값의 출력이 끝나면 메모리 할당 해제  swift inout문법 c++의 레퍼런스 참조와 같은 느낌
//
//
//NotificationCenter.default.post(Notification(name: myNotification))
//NotificationCenter.default.post(Notification(name: myNotification))


//KVO - key Value Obsertving

class myFirend {
    var name = "철수" {
        didSet{
            print("name - didSet(): ",name)
        }
    }
}


var myFriend = myFirend()

print("현재이름: \(myFriend.name)")
["영수"].publisher.assign(to: \.name, on: myFriend).store(in: &mySubscriptionSet)
    //.publihser 까지는 pbulihser 생성 후 ,  assign(to: (해당 루트)\ (어떤 변수를 관찰할 것인지) .name ,on :루트 변수)
    

print("현재이름 2: \(myFriend.name)")
myFriend.name = "민수"
print("현재이름 3: \(myFriend.name)")



