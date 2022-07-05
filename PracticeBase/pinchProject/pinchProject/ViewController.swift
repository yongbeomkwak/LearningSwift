//
//  ViewController.swift
//  pinchProject
//
//  Created by yongbeomkwak on 2022/07/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtLabel: UILabel!
    
    var initialFontSize:CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.doPinch(_:)))
        
        //UIPinchGestureRecognizer, Action인수는 handler 함수
        
        
        //Regist Pinch
        self.view.addGestureRecognizer(pinch)
        
        
        
       
    }
    
    @objc func doPinch(_ pinch:UIPinchGestureRecognizer){
        
        if(pinch.state == UIGestureRecognizer.State.began){
            //핀치 제스쳐의 state를 확인
            //state가 began이면 initialFontSize에 현재 레이블 font사이즈 저장
            initialFontSize = txtLabel.font.pointSize
        }
        else
        {
            txtLabel.font = txtLabel.font.withSize(initialFontSize*pinch.scale)
            
            //아니라면 현재사이즈 * scale속성을 곱하여 확대 혹은 축소
        }
    }
        

}

