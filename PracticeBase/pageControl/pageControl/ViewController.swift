//
//  ViewController.swift
//  pageControl
//
//  Created by yongbeomkwak on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageContol: UIPageControl!
    
    let images = ["cat.jpeg","dog.jpeg","fg.jpeg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageContol.numberOfPages = images.count
        pageContol.currentPage = 0
        imgView.image = UIImage(named: images[0])
        // Do any additional setup after loading the view.
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        
        imgView.image = UIImage(named: images[pageContol.currentPage])
    }
    
}

