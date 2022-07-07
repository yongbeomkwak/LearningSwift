//
//  ViewController.swift
//  imagePicker
//
//  Created by yongbeomkwak on 2022/07/06.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()

    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true,completion: nil ) //imagePicker를 모달로 뛰워줌
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { //취소했을 때
        print("Cacel")
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //UIImagePickerController.InfoKey.originalImage 키에  UIImage 형태로 데이터를 가져옴
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
  

}

