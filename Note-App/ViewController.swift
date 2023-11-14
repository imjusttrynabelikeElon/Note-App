//
//  ViewController.swift
//  Note-App
//
//  Created by Karon Bell on 11/13/23.
//

import UIKit
protocol DataDelegate {
    func updateArray(newArray: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var notesArray = [Note]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        
        
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        cell.textLabel?.text = notesArray[indexPath.row].title
        return cell
        
    }
    

    @IBOutlet weak var notesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes()
        print(notesArray)
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        
        
     
        // Do any additional setup after loading the view.
    }
    
   
    

}




extension ViewController: DataDelegate {
    func updateArray(newArray: String) {
        
        do {
            notesArray = try JSONDecoder().decode( [Note].self, from: newArray.data(using: .utf8)!)
            print(newArray)
        } catch {
            print("Failed to decode")
        }
        self.notesTableView?.reloadData()
    }
    
    
}
