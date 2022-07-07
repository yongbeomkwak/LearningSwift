//
//  ViewController.swift
//  singleTon
//
//  Created by yongbeomkwak on 2022/07/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameFiedl: UITextField!
    @IBOutlet var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchUpZSetButton(_ sender: UIButton) {
        
        UserInformation.shared.name = nameFiedl.text
        UserInformation.shared.age = ageField.text
    }
}

