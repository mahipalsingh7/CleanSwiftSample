//
//  Employee.swift
//  CleanSwiftArchitecture
//
//  Created by india on 09/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import Foundation
/**
 EmployeeModel is the model class for the Employees
 Sample
 {"id":"34","employee_name":"Gavin Cortez","employee_salary":"235500","employee_age":"22","profile_image":""}
 */

class EmployeeModel: Codable {
    /** The unique  id of the employee */
    var id: String?
    
    /** Employee Name */
    var employee_name: String?
    
    /** Employee Salary */
    var employee_salary: String? //Not in Use
    
    /** The Employee profile image */
    var profile_image: String?
    
    /** Employee age */
    var employee_age: String?
}
