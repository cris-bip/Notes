//
//  NoteManager.swift
//  Notes
//
//  Created by OITD on 22/09/23.
//

import Foundation

class NoteManager{
    private var notes: [Note] = []
    
    func createNote(note: Note){
        notes.append(note)
    }
    
    func deleteNote(at index: Int){
        notes.remove(at: index)
    }
    
    func countNotes() -> Int{
        return notes.count
    }
    
    func getNote(at index: Int) -> Note{
        return notes[index]
    }
    
    func getNotes() -> [Note] {
        return notes
    }
    
    func loadNotes(){
        // TODO: Load notes from filesystem
    }
    
    func saveNotes(){
        // TODO: Save notes to filesystem
    }
    
    func updateNotes(note: Note, at index: Int){
        // TODO: Update a note in the specified index
        
    }
}
