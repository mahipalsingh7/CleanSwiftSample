//
//  EmployeesVC.swift
//  CleanSwiftArchitecture
//
//  Created by india on 09/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import UIKit
import SWRevealViewController

/**
 1. View Controller ask the Interactor for request of the data, again Intereator ask Presenter to get data from service and Once Presenter get data from Service the formated data will pass back to View controller for displaying result.
 */

protocol GetEmpolyeeListInput {
    func displayEmployees(arrEmplyees: [EmployeeModel])
}

class EmployeesVC: UIViewController,GetEmpolyeeListInput {
    
    var employeeListArr = [EmployeeModel]()
    var interactor: EmployeeInteractorRequest?
    @IBOutlet weak var emplioyeetable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))

             self.revealViewController()?.rearViewRevealWidth = 300.0 // how much of the menu is shown (default 260.0)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
        setup()
        emplioyeetable.delegate = self
        emplioyeetable.dataSource = self
        interactor?.requestListOfEmployees()
        // Do any additional setup after loading the view.
    }
    
    func displayEmployees(arrEmplyees: [EmployeeModel]) {
        //load tableview list
        employeeListArr = arrEmplyees
        DispatchQueue.main.async {
            self.emplioyeetable.reloadData()
        }
    }
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = EmployeeInteractor() //call interactor
        let presenter = EmployeeListPresenter() // intreactor call presenter
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.display = self // presenter call View controller
    }
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EmployeeDetailVCSegue" {
            if let indexPath = self.emplioyeetable.indexPathForSelectedRow {
                let selectedEmp = employeeListArr[indexPath.row]
                let empVC = segue.destination as! EmployeeDetailVC
                 empVC.employeee = selectedEmp
            }
        }
    }
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE

extension EmployeesVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeListArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}

extension EmployeesVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        
        if self.employeeListArr.count > 0 {
            cell?.textLabel!.text = self.employeeListArr[indexPath.row].employee_name
        }
        
        cell?.textLabel?.numberOfLines = 0
        
        return cell!
    }
}

