//
//  ViewController.swift
//  Networking
//
//  Created by yongbeomkwak on 2022/07/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    let cellIdentifier: String = "friendCell"
    var friends: [Friend] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil //나중에 재사용 되기 위해 // 나중에 플레이스 홀더 이미지 사용하면 좋음
        
        DispatchQueue.global().async { //글로벌 큐
            guard let imageURL: URL = URL(string: friend.picture.thumbnail) else {return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else {return } //데이터 가져오기
            
            DispatchQueue.main.async { //UI를 건드려야 하므로 main
                
                if let index: IndexPath = tableView.indexPath(for: cell) { //요청을 시작할 때 보이는 인덱스
                    if index.row == indexPath.row{ // 요청시작 시 인덱스 == 현재 보이는 인덱스
                        //만약 위에서 데이터를 불러오는데 스크롤 되어 불러올 때 셀과 현재 보이는 셀의 인덱스가 다를 수 있기 때문에 한번 검사
                        cell.imageView?.image = UIImage(data: imageData)
                        cell.setNeedsLayout()
                        
                    }
                    
                    
                }
                
            }
        }
        
        
        
       
        
        
        return cell
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         addObserver(_:selector:name:object:) : 노티피케이션을 노티피케이션 센터의 메서드를 가리키는 장소에 이름을 추가합니다.
         */
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRecieveFriendsNotification(_:)), name: DidReceiveFriendsNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    @objc func didRecieveFriendsNotification(_ noti:Notification){
        
        
        guard let friends: [Friend] = noti.userInfo?["friends"] as? [Friend] else {return}
        
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestFriend()
       
    }


}

