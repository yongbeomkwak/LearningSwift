//
//  ViewController.swift
//  RadioButtonTest
//
//  Created by yongbeomkwak on 2022/07/16.
//

import UIKit
import RxSwift
import RxCocoa
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
        }
        if(sender_idx==index)
        {
            print("Same")
        }
        else
        {
            
            index = sender_idx
            
            sender.backgroundColor = .red
            sender.isSelected = true
            for unselectedIndex in radioButtons.indices
            {
                if(unselectedIndex != index)
                {
                    radioButtons[unselectedIndex].backgroundColor = .green
                    radioButtons[unselectedIndex].isSelected = false
                }

            }
            
        }

       
        
    }
}

