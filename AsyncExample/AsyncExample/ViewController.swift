//
//  ViewController.swift
//  AsyncExample
//
//  Created by yongbeomkwak on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pictureDownload(_ sender: UIButton) {
    
        guard let imageURL: URL = URL(string: "https://picsum.photos/0")
        else {
            print("Here1")
            return}
        do {
            OperationQueue().addOperation {
                let imageData: Data = try! Data.init(contentsOf: imageURL)
                guard let image: UIImage = UIImage(data: imageData)
                //별도의 스레드에서 image를 가져오고
                        
                else {
                    print("Here2")
                    return}
                
                OperationQueue.main.addOperation {
                    //UI는 메인스레드에서 건드려야 하므로 main에서 작업
                    self.imgView.image = image
                }
                
            }
        }
       
        
        
        
        
        
        
        
        
        
        
    }
}

