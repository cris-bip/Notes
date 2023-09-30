//
//  AddNoteViewController.swift
//  Notes
//
//  Created by OITD on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var noteTitle: UITextView!
    
    @IBOutlet var noteContent: UITextView!
    
    var newNote: Note?
    
    var isNewNote = false
    var hasChanged = false    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextViews()
        
        noteTitle.delegate = self
        noteContent.delegate = self
        
        if(newNote != nil){
            noteTitle.text = newNote?.title
            noteContent.text = newNote?.content            
        }
    }
    
    func setupTextViews(){
        noteTitle.text = ""
        noteContent.text = ""
        
        noteTitle.layer.borderWidth = AppConstants.BORDER_WITH
        noteTitle.layer.borderColor = UIColor.white.cgColor
        
        noteContent.layer.borderWidth = AppConstants.BORDER_WITH
        noteContent.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        newNote = Note(title: noteTitle.text, content: noteContent.text, date: Date())
        
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
        destination.isNewNote = isNewNote
        destination.hasChanges = hasChanged
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let isValidNote = !noteTitle.text.isEmpty && !noteContent.text.isEmpty
        if(!isValidNote){
            let alert = UIAlertController(title: "Datos incompletos", message: "Se debe agregar un título y el contenido de la nota", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            // Sin acción
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        
        return isValidNote
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        hasChanged = true
    }
}
