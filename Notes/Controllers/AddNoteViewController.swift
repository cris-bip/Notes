//
//  AddNoteViewController.swift
//  Notes
//
//  Created by OITD on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet var noteTitle: UITextView!
    
    @IBOutlet var noteContent: UITextView!
    
    var newNote: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noteTitle.text = ""
        noteContent.text = ""
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        newNote = Note(title: noteTitle.text, content: noteContent.text, date: Date())
        
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return !noteTitle.text.isEmpty && !noteContent.text.isEmpty
    }
    
}
