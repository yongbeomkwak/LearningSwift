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
                    }
                    
                    
                }
                
            }
        }
        
        
        
       
        
        
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url:URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {return}
        
        let session: URLSession = URLSession(configuration: .default) //세션 만들고
        
        //데이터 테스크를 만듬
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error:Error?) in
            
            
            //요청이 왔을 때 핸들러 함수
            if let error = error {
                print("First Error")
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {return}
            
            
            do {
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.results
                
                DispatchQueue.main.async { //메인 스레드
                    self.tableView.reloadData()
                }
               
            } catch(let err){
                
                print(err.localizedDescription)
            }
        }
        
        dataTask.resume()//요청 시도
    }


}

