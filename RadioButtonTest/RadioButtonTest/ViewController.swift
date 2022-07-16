//
//  ViewController.swift
//  RadioButtonTest
//
//  Created by yongbeomkwak on 2022/07/16.
//

import UIKit

class ViewController: UIViewController {
    
    var index:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for btn in radioButtons{
            
            btn.setTitleColor(.red, for: .selected)
            btn.setTitleColor(.tintColor, for: .normal)
        }
        radioButtons[0].isSelected = true
    }
    
    
    @IBOutlet var radioButtons: [UIButton]!
    
    @IBAction func touchButton(_ sender:UIButton)
    {
        var sender_idx:Int = 0
        for idx in radioButtons.indices
        {
            if(radioButtons[idx]==sender)
            {
                sender_idx = idx
            }
            radioButtons[idx].isSelected = false
        }
        if(sender_idx==index)
        {
            print("Same")
        }
        else
        {
            sender.isSelected = true
            index = sender_idx
            print("DIFF")
        }
        
        sender.isSelected = true
        
    }
}

