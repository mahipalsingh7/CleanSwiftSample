//
//  EmployeePresenter.swift
//  CleanSwiftArchitecture
//
//  Created by india on 09/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import Foundation
/**
 Presenter class for Request Data from service and format the data send back to view COntroller
 */

protocol EmployeePresenter {
    func presentFetchedEmployees(response:[Dictionary<String, AnyObject>])
}

class EmployeeListPresenter: EmployeePresenter {
    var display: GetEmpolyeeListInput? = nil //defined in Controller
    func presentFetchedEmployees(response: [Dictionary<String, AnyObject>]) {
        var arr = [EmployeeModel]()
        for dic in response {
            let obj = EmployeeModel()
            obj.id = dic["id"] as? String
            obj.employee_name = dic["employee_name"] as? String
            obj.employee_salary = dic["employee_salary"] as? String
            obj.profile_image = dic["profile_image"] as? String
            obj.employee_age = dic["employee_age"] as? String
            arr.append(obj)
        }
        display?.displayEmployees(arrEmplyees:arr) // Send data direclty to View Controller
    }

}


