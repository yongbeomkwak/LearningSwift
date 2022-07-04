//
//  ViewController.swift
//  Alert
//
//  Created by yongbeomkwak on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    let imgDog=UIImage(named: "dog.jpeg")
    let imgCat=UIImage(named: "cat.jpeg")
    var isDog:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image=imgDog
    }

    @IBAction func btnDog(_ sender: UIButton) {
        
        if(isDog==true){
            let alreadyCat = UIAlertController(title: "알림", message: "이미 강아지입니다.", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "알겠습니다.", style: UIAlertAction.Style.default,handler: nil)
            
            alreadyCat.addAction(onAction)
            present(alreadyCat, animated: true,completion: nil)
            
            isDog=true
        }
        else{
            let changeDogAlert = UIAlertController(title: "알림", message: "강아지로 바꿀까요?", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { (action:UIAlertAction!) in
                self.imgView.image = self.imgDog
                self.isDog = true
                print("Call Handler")
            })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            changeDogAlert.addAction(onAction)
            changeDogAlert.addAction(cancelAction)
            
            present(changeDogAlert, animated:true,completion: nil)
            
            
        }
        
    }
    
    @IBAction func btnCat(_ sender: UIButton) {
        if(isDog==false){
            let alreadyCat = UIAlertController(title: "알림", message: "이미 고양이입니다.", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "알겠습니다.", style: UIAlertAction.Style.default,handler: nil)
            
            alreadyCat.addAction(onAction)
            present(alreadyCat, animated: true,completion: nil)
            
            isDog=false
        }
        else{
            let changeDogAlert = UIAlertController(title: "알림", message: "고양이로 바꿀까요?", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.imgView.image = self.imgCat
                self.isDog = false
                print("Call Handler")
            })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            changeDogAlert.addAction(onAction)
            changeDogAlert.addAction(cancelAction)
            
            present(changeDogAlert, animated:true,completion: nil)
            
            
        }
    }
}

