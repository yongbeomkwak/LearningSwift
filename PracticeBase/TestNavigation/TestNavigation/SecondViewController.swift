//
//  SecondViewController.swift
//  TestNavigation
//
//  Created by yongbeomkwak on 2022/07/06.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var btnPop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func popToPrev(_ sender: UIButton) {
        print("POP4")
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
