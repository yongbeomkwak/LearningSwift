//
//  ViewController.swift
//  CountDown
//
//  Created by yongbeomkwak on 2022/07/03.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    @IBOutlet var lbTimer: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        /*
         scheduledTimer 설정
         간격,동작될 타겟,타이머 구동시 실행될 함수,사용자 정보, 반복 여부
         */
    }
    @objc func updateTime() //object-c 방식 컴파일
    {
        lbTimer.text=String(count)
        count=count+1
    }
    
    


}

