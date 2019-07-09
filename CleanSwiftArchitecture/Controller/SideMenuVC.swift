//
//  SideMenuVC.swift
//  CleanSwiftArchitecture
//
//  Created by india on 09/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
    let listArray = ["Empolyee  List", "Other Controller", "Alert"]
    @IBOutlet weak var menutable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menutable.delegate = self
        menutable.dataSource = self
        menutable.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
}

// MARK - UITableView Delegates

extension SideMenuVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        if self.listArray.count > 0 {
            cell?.textLabel!.text = self.listArray[indexPath.row]
        }
        cell?.textLabel?.numberOfLines = 0
        
        return cell!
    }

}

extension SideMenuVC:UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 || indexPath.row == 2 {
            self.showAlerButton()
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)//[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        let nvg = storyboard.instantiateViewController(withIdentifier: "EmployeesVCNvg") as? UINavigationController
        self.revealViewController().setFront(nvg, animated: true)
        self.revealViewController()?.revealToggle(nil)
        
    }

}
