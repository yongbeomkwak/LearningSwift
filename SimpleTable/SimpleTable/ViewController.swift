//
//  ViewController.swift
//  SimpleTable
//
//  Created by yongbeomkwak on 2022/07/07.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier:String = "cell"
    
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"]
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var dates: [Date] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 //3개의 row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Row의 갯수가 몇개야 한느지
        
        switch section{
            //Section 0 부터 시작
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Row마다 어떤셀을 삽입
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        //withIdentifier과 Main에 tableViewcell의 identifer의 이름 일치 해야함
        if(indexPath.section < 2){
        let text:String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
        cell.textLabel?.text = text
        }
        else{
            cell.textLabel?.text = self.dateFormatter.string(from: dates[indexPath.row])
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //섹션별 타이틀
        if section < 2{
        return section == 0 ? "한글" : "영어"
        }
        return nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Main보드를 이용하여 연결 했기 때문에 주석
        //코드로 연결
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func tochUpAddButton(_ sender: UIButton) {
        dates.append(Date())
        
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
        
        
    }


}

