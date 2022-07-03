//
//  ViewController.swift
//  TestDataPicker
//
//  Created by yongbeomkwak on 2022/07/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbPickerTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView=sender
        let formatter=DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lbPickerTime.text="선택시간: " + formatter.string(from: datePickerView.date)
        
    }
}

