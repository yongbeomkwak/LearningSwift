//
//  ViewController.swift
//  paintApp
//
//  Created by yongbeomkwak on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    var lastPoint : CGPoint! //바로전에 터치하거나 이동한 위치
    var lineSize : CGFloat = 2.0 //선 두께
    var lineColor = UIColor.red.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearImgView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch //터치 이벤트 가져오기
        lastPoint = touch.location(in: imgView) //터치된 위치 정보 저장
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        
        let touch = touches.first! as UITouch //터치 이벤트 가져오기
        let currPoint = touch.location(in: imgView) //터치된 위치 정보 저장
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        //그림판 영역 설정
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) //시작 위치를 lastPoint로 옮김
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y)) //현재 위치까지 선 그림
        
        UIGraphicsGetCurrentContext()?.strokePath()
        
        
        imgView.image=UIGraphicsGetImageFromCurrentImageContext() // ImageConter로 부터 얻기
        UIGraphicsEndImageContext() //그리기 끝내기
        
        lastPoint = currPoint //lastPoint위치 옮김
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        

        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        //그림판 영역 설정
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) //시작 위치를 lastPoint로 옮김
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) //현재 위치까지 선 그림
        
        UIGraphicsGetCurrentContext()?.strokePath()
        
        
        imgView.image=UIGraphicsGetImageFromCurrentImageContext() // ImageConter로 부터 얻기
        UIGraphicsEndImageContext() //그리기 끝내기
        
       
    }
    
}

