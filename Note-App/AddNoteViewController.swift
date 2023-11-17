//
//  AddNoteViewController.swift
//  Note-App
//
//  Created by Karon Bell on 11/16/23.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    
    var note: Note?
    var update = false
    
    
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var bodyTitleView: UITextView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    @IBAction func saveClick(_ sender: Any) {
     //   APIFunctions.functions.addNote(date: "Placeholder", title: titleTextField.text!, note: bodyTitleView.text!)
        
        if update == true {
            APIFunctions.functions.updateNote(date: "Placeholder", title: titleTextField.text!, note: bodyTitleView.text!, id: note!._id)
        } else {
            APIFunctions.functions.addNote(date: "Placeholder", title: titleTextField.text!, note: bodyTitleView.text!)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        APIFunctions.functions.deleteNote(id: note!._id)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if update == false {
            self.deleteButton.isEnabled == false
            self.deleteButton.title = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        if update == true {
            titleTextField.text = note!.title
            bodyTitleView.text = note!.note
        }
     
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
