//
//  ViewController.swift
//  Alert
//
//  Created by yongbeomkwak on 2022/07/10.
//

import UIKit

class ViewController: UIViewController {
    
    
    func showAlertController(style: UIAlertController.Style){
        
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action:UIAlertAction) in
            if let txt = alertController.textFields?[0] { //가장
                print("첫번째 인풋 \(txt.text!)")
            }
            if let txt = alertController.textFields?[1] { //가장
                print("두번째 인풋 \(txt.text!)")
            }
            
            if let txt = alertController.textFields?[2] { //가장
                print("세번째 인풋 \(txt.text!)")
            }
        })
        
        let cancelAction:UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        
        handler = { (action:UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some", style: .destructive, handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: .destructive, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        alertController.addTextField{(field:UITextField) in
            field.placeholder = "플레이스 홀더1"
            field.textColor = UIColor.red
        }
        alertController.addTextField{(field:UITextField) in
            field.placeholder = "플레이스 홀더2"
            field.textColor = UIColor.blue
        }
        alertController.addTextField{(field:UITextField) in
            field.placeholder = "플레이스 홀더3"
            field.textColor = UIColor.green
        }
        
        
        
        
        self.present(alertController, animated: true, completion: {
            print("Alert controller shown")
        })
    }
    
    @IBAction func touchShowAlertButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        self.showAlertController(style: .actionSheet)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

