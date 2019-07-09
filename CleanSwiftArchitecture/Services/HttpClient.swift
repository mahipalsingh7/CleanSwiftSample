//
//  HttpClient.swift
//  CleanSwiftArchitecture
//
//  Created by india on 09/07/19.
//  Copyright © 2019 Mahipal Singh. All rights reserved.
//

import UIKit

/**
 HttpClient is an instace class used to call API (web service) for application
 */


class HttpClient: NSObject {
    func GetEmployeeList(completion: @escaping (_ success: Bool, _ errorMessage: String?, _ object: AnyObject?) -> ()) {
          let todoEndpoint: String = API_NAME.GET_LIST_OF_EMPOLYEE
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on todoEndpoint")
                print(error!)
                completion(false, error?.localizedDescription , nil)
                return
            }
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//           print( "basic response URL \(String(describing: response?.url)) and Response : \(str as AnyObject)")
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let responsejson = json {
                
                completion(true,"", responsejson as AnyObject )
            }else {
                
               completion(false, "did not receive data" , nil)
            }
              
           
        }
        task.resume()
    }
    
    
}
