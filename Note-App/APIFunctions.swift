//
//  APIFunctions.swift
//  Note-App
//
//  Created by Karon Bell on 11/13/23.
//


import Foundation
import UIKit
import Alamofire

struct Note: Decodable {
    var title: String
    var date: String
    var _id: String
    var note: String
}




class APIFunctions {
    
    var delegate: DataDelegate?
    
    static let functions = APIFunctions()
    func fetchNotes() {
        AF.request("http://192.168.1.167:8081/fetch").response {
            res in
            print(res.data as Any)
            
            let data = String(data: res.data!, encoding: .utf8)
            
            
            
            self.delegate?.updateArray(newArray: data!)
            
        }
    }
}
