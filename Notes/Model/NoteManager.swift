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
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let noteUrlPath = documentDirectory.appendingPathComponent("notes.json")
        
        do{
            let jsonData = try JSONEncoder().encode(notes)
            fileManager.createFile(atPath: noteUrlPath.absoluteString, contents: jsonData)
            
        }catch let error{
            print(error)
        }
    }
    
    func updateNotes(note: Note, at index: Int){
        // TODO: Update a note in the specified index
        
    }
}
