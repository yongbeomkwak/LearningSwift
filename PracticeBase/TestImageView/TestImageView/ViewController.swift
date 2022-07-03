//
//  ViewController.swift
//  TestImageView
//
//  Created by yongbeomkwak on 2022/07/03.
//

import UIKit

class ViewController: UIViewController {
    var isZoom:Bool = false
    var imgLight:UIImage?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgLight = UIImage(named: "bulbOn.png")
        imgView.image=imgLight
        // Do any additional setup after loading the view.
    }

    @IBAction func btnResizeImg(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat,newHeight:CGFloat
        
        if(isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대",for: .normal)
        }
        else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소",for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
}

