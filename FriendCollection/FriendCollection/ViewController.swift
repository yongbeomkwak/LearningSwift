//
//  ViewController.swift
//  FriendCollection
//
//  Created by yongbeomkwak on 2022/07/09.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell:FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? FriendCollectionViewCell  else{
            return UICollectionViewCell()
        }
        
        let friend:Friend = friends[indexPath.item]
        
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.adressLabel.text = friend.fullAdress

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //tableView indexPath.row == collectionView indexPath.item
        //어떤 셀이 선택되었을 때 , 개수를 늘린다
    
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let jsonDecoder : JSONDecoder = JSONDecoder()
        guard let dataAsset : NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do{
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        
        self.collectionView.reloadData()
        // Do any additional setup after loading the view.
    }


}

