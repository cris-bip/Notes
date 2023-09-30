//
//  NoteManager.swift
//  Notes
//
//  Created by OITD on 22/09/23.
//

import Foundation

class NoteManager{
    private var notes: [Note] = []
    
    init() {
        loadNotes()
    }
    
    func commitChange(){
        saveNotes()
        
        loadNotes()
    }
    
    func createNote(note: Note){
        notes.append(note)
        
        commitChange()
    }
    
    func deleteNote(at index: Int){
        notes.remove(at: index)
        
        commitChange()
    }
    
    func updateNote(note: Note, at index: Int){
        notes.replaceSubrange(index...index, with: [note])
        
        commitChange()
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
    
    func getFilePath() -> String{
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let noteUrlPath = documentDirectory.appendingPathComponent("notes.json")
        
        return URL(string: noteUrlPath.absoluteString)!.path
    }
    
    func loadNotes(){
        let notesPath = getFilePath()
        
        let fileManager = FileManager.default
        
        if(fileManager.fileExists(atPath: notesPath)){
            
            do{
                let jsonData = fileManager.contents(atPath: notesPath)
                
                notes = try JSONDecoder().decode([Note].self, from: jsonData!)
                
            }catch let error{
                print(error)
            }
        }else{
            // File doesn't exist
        }
        
        
    }
    
    func saveNotes(){
        let fileManager = FileManager.default
        
        do{
            let jsonData = try JSONEncoder().encode(notes)
            fileManager.createFile(atPath: getFilePath(), contents: jsonData)
            
        }catch let error{
            print(error)
        }
    }
}
