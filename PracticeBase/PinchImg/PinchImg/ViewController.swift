//
//  ViewController.swift
//  PinchImg
//
//  Created by yongbeomkwak on 2022/07/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.doPinch(_:)))
        
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch:UIPinchGestureRecognizer)
    {
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        
        pinch.scale = 1
    }


}

