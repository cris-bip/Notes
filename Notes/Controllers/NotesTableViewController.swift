//
//  NotesTableViewController.swift
//  Notes
//
//  Created by OITD on 22/09/23.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    var note: Note?

    @IBOutlet var emptyNoteView: UIView!
    
    let noteManager = NoteManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateBackgroundView()
    }
    
    func updateBackgroundView(){
        if(noteManager.countNotes() == AppConstants.EMPTY_NOTES){
            emptyNoteView.isHidden = false
            self.tableView.backgroundView = emptyNoteView
        }else{
            emptyNoteView.isHidden = true
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return AppConstants.UNIQUE_SECTION
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteManager.countNotes()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.REUSE_CELL_ID, for: indexPath) as UITableViewCell

        let note = noteManager.getNote(at: indexPath.row)
        
        cell.textLabel!.text = note.title
        cell.detailTextLabel!.text = note.date.formatted()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: AppConstants.ADD_NOTE_SEGUE_ID, sender: noteManager.getNote(at: indexPath.row))
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            noteManager.deleteNote(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {                
        let noteNav = segue.destination as! UINavigationController
        let noteController = noteNav.viewControllers.first as! AddNoteViewController
                
        // TODO: Error al agregar nota, validar tipo de sender
        noteController.newNote = (sender as! Note)
    }
    
    
    @IBAction func unwindToNotesTable(segue: UIStoryboardSegue){
        let source = segue.source as! AddNoteViewController
        note = source.newNote
        
        noteManager.createNote(note: note!)
        updateBackgroundView()
        
        noteManager.saveNotes()
        
        noteManager.loadNotes()
        tableView.reloadData()
    }

}
