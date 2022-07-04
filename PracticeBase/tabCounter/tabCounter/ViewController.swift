//
//  ViewController.swift
//  tabCounter
//
//  Created by yongbeomkwak on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lbCounter.text = String(touch.tapCount)
    }


}

