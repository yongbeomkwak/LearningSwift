//
//  ViewController.swift
//  CombineProject2
//
//  Created by yongbeomkwak on 2022/07/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    
    @IBOutlet var myLabel: UILabel!
    private var searchController : UISearchController  = {
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = . black
        searchController.searchBar.searchTextField.accessibilityIdentifier = "mySearchBarTextField"
        
        return searchController
    }()
    
    var mySubscription = Set<AnyCancellable> ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.searchController = searchController
        searchController.isActive = true
        
        searchController.searchBar.searchTextField
            .myDebouceSearchPublisher
            .sink { [weak self] (receivedValue) in
                //구독할 때 self를 사용할 때는 약한 참조를 사용한다 .
                self?.myLabel.text = receivedValue
            }.store(in: &mySubscription)
    }
    
    
}


extension UISearchTextField {
    var myDebouceSearchPublisher : AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: self)
        //노티피케이션 센터에서 UISearchTextField 가져옴
        
            .compactMap { $0.object as? UISearchTextField}
            .map{$0.text ?? ""}
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main) //1초 있다가 탐지 함 , 항상 감지하는 것을 방지하기 위해
            .filter{$0.count > 0 }//비어있지 않을 때만
            .eraseToAnyPublisher() // Unwrapped 함
        
    }
}

