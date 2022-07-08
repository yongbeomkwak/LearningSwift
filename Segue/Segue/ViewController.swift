//
//  ViewController.swift
//  Segue
//
//  Created by yongbeomkwak on 2022/07/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tvField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else{
            print("Re1")
            return
        }
        
        guard let tmp:UIView = sender as? UIView else{
            return
        }
        
        nextViewController.textToset = self.tvField.text
        
        
    }
   

}

