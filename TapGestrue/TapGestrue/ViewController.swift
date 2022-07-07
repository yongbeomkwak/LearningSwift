//
//  ViewController.swift
//  TapGestrue
//
//  Created by yongbeomkwak on 2022/07/07.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBAction func tapView(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       /*
        방법 1
        let tapGesture: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        self.view.addGestureRecognizer(tapGesture)*/
        
        let tapGestrue: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGestrue.delegate = self
        
        self.view.addGestureRecognizer(tapGestrue)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
   


}

