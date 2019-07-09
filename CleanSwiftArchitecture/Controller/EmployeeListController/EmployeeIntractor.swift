//
//  EmployeeIntrector.swift
//  CleanSwiftArchitecture
//
//  Created by india on 09/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import Foundation
/**
 Intreactor class for Request Data to presenter
 */

protocol EmployeeInteractorRequest {
    func requestListOfEmployees()
}

class EmployeeInteractor: EmployeeInteractorRequest {
    var presenter: EmployeePresenter? = nil // Ask the present to format the raw response and send to controller
    func requestListOfEmployees() {
        HttpClient().GetEmployeeList { (_ succes, _ message, _ response) in
            self.presenter?.presentFetchedEmployees(response:response as! [Dictionary<String, AnyObject>])
        }
    }
   
}
