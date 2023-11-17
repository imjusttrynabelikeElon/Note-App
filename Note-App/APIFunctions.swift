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
          AF.request("http://192.168.1.167:8081/fetch").response { response in
              if let responseData = response.data {
                  print(responseData as Any)
                  
                  if let dataString = String(data: responseData, encoding: .utf8) {
                      self.delegate?.updateArray(newArray: dataString)
                  } else {
                      // Handle inability to convert data to string
                      print("Unable to convert data to string")
                  }
              } else {
                  // Handle nil response data
                  print("Response data is nil")
              }
          }
      }
    
    func addNote(date: String, title: String, note: String) {
        AF.request("http://192.168.1.167:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note]).responseJSON {
            res in
            print(res)
            
        }
        

    }
    
    
    
    
    func updateNote(date: String, title: String, note: String, id: String) {
        AF.request("http://192.168.1.167:8081/update", method: .post, encoding: URLEncoding.httpBody,headers: ["title": title, "date": date, "note": note, "id": id]).responseJSON {
            res in
            print(res)
        }
    }
    
    func deleteNote(id: String) {
        AF.request("http://192.168.1.167:8081/delete", method: .post, encoding: URLEncoding.httpBody,headers: [ "id": id]).responseJSON {
            res in
            print(res)
        }
    }
}
