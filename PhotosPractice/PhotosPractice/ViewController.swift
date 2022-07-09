//
//  ViewController.swift
//  PhotosPractice
//
//  Created by yongbeomkwak on 2022/07/09.
//

import UIKit
import Photos
class ViewController: UIViewController,UITableViewDataSource {
    
    
    
    
    
    
    
    
    
    

    
    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager() //가져온 에셋을 가지고 이미지로드 담당
    let cellIdentifier: String = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFit, options: nil, resultHandler: { image, _ in
            cell.imageView?.image = image
        })
        
        return cell
    }

    func requestCollection() {
        
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        //사진 찍으면 저장되는 곳
        
        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        } //사진들
        
        let fetchOptions = PHFetchOptions()
        
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]//최신순으로 정렬
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //허용 여부 확인
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAurhorizationStatus {
        case .notDetermined:
            print("아직 응답하지 않음")
            //Requst
            PHPhotoLibrary.requestAuthorization({(status) in
                switch status {
        
                case .denied:
                    print("사용자가 불허함")
                case .authorized:
                    print("허용")
                    self.requestCollection()
                    OperationQueue.main.addOperation { //메인 스레드에서 실행 
                        self.tableView.reloadData()
                    }
                    
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        case .denied:
            print("접근 불허")
        case .authorized:
            print("접근 허용")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
                
            }
        case .limited:
            print("접근 제한")
        
        default:break
        }
        
        
        
        
        
       
        // Do any additional setup after loading the view.
    }
    
    

    
    
    

    
    

}

