//
//  ViewController.swift
//  CombineProjcet1
//
//  Created by yongbeomkwak on 2022/07/24.
//

import UIKit
import Combine
class ViewController: UIViewController {
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    @IBOutlet var myBtn: UIButton!
    
    
    var viewModel : MyViewModel!
    private var mySubscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = MyViewModel()
        
        passwordTextField
            .myTextPublisher
            .print()
        //스레드 - 메인에서 받겠다
            .receive(on: DispatchQueue.main)
        //구독
            .assign(to: \.passwordInput, on: viewModel) //KVO
            .store(in: &mySubscriptions)
        
        
        passwordConfirmTextField
            .myTextPublisher
            .print()
        //스레드 - 메인에서 받겠다
            .receive(on: DispatchQueue.main)
        //구독
            .assign(to: \.passwordConfirmInput, on: viewModel) //KVO
            .store(in: &mySubscriptions)
        
        
        
        //버튼이 뷰모델의 isMatchPasswordInput Publisher를 구독
        
        viewModel.isMatchPasswordInput
            .receive(on: RunLoop.main)
        //구독
            .assign(to: \.isVaild, on: myBtn)
            .store(in: &mySubscriptions)
    }
    
    
}

extension ViewController{
    
    final class MyViewModel {
        
        //@published 어노테이션을 통해 구독이 가능하도록 설정
        @Published var passwordInput: String = ""
        @Published var passwordConfirmInput : String = ""
        
        
        lazy  var isMatchPasswordInput : AnyPublisher<Bool, Never> = Publishers
        //passwordInput과 Confirm 두개의 가장 마지막 변경값을 사용
            .CombineLatest($passwordInput,$passwordConfirmInput)
            .map({ (password:String, passwordConfirm:String) in
                
                if password == "" || passwordConfirm == "" {
                    return false
                }
                
                if password == passwordConfirm {
                    return true
                }
                else {
                    return false
                }
            })
            .print()
            .eraseToAnyPublisher()
    }
}

extension UITextField{
    var myTextPublisher : AnyPublisher<String, Never> {
        
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self) //textDidChange알림 받기
        //UITextFiled 가져옴
            .compactMap{$0.object as? UITextField}
        
        //text가져옴 String?
            .map{$0.text ?? ""}
        
        //string을 AnyPublisher로 변환하여 최종 리턴
            .eraseToAnyPublisher()
        
        
    }
}

extension UIButton {
    var isVaild: Bool {
        
        get {
            backgroundColor == .yellow
        }
        
        set {
            //newValue가 true면 background yellow 아니면 .lightGray
            backgroundColor = newValue ? .yellow : .lightGray
            isEnabled = newValue
            setTitleColor(newValue ? .blue : .white, for: .normal)
        }
    }
}

