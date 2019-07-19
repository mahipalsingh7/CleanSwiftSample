//
//  EmployeeDetailVC.swift
//  CleanSwiftArchitecture
//
//  Created by india on 10/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import UIKit

class EmployeeDetailVC: UIViewController {
    
    var employeee:EmployeeModel!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var agalbl: UILabel!
    @IBOutlet weak var idlbl: UILabel!
    @IBOutlet weak var salarylbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = employeee.employee_name
        agalbl.text = employeee.employee_age
        idlbl.text = employeee.employee_age
        salarylbl.text = employeee.employee_salary
        // Do any additional setup after loading the view.
    }
}
