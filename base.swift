import UIKit

let age:Int = 10


print("안녕하세요! 저는 \(age+5)살 입니다.")
// 안녕하세요! 저는 15살 입니다.

class Person{
    var name:String = "yongbeom"
    var age:Int = 10
}

let yb:Person = Person()

print(yb)
// __lldb_expr_1.Person

dump(yb)
/*
__lldb_expr_1.Person #0
- name: "yongbeom"
- age: 10
 */