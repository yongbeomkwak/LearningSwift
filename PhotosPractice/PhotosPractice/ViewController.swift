//
//  ViewController.swift
//  PhotosPractice
//
//  Created by yongbeomkwak on 2022/07/09.
//

import UIKit
import Photos
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,PHPhotoLibraryChangeObserver {
    
    //PHPhotoLibraryChangeObserver 포토 변화 감지 프로토콜
    
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { //편집 가능
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { //편집이 삭제 상태면
            let asset: PHAsset = self.fetchResult[indexPath.row] //삭제할 에셋
            
            //해당 에셋 삭제
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
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
    
    func photoLibraryDidChange(_ changeInstance: PHChange) { //옵저버
        guard let changes = changeInstance.changeDetails(for: fetchResult) else{return}
        
        fetchResult = changes.fetchResultAfterChanges// 변화 패치 결과
        
        OperationQueue.main.addOperation { //메인 쓰레드
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //허용 여부 확인
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        PHPhotoLibrary.shared().register(self)// 옵저버 등록
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

