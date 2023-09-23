//
//  AddNoteViewController.swift
//  Notes
//
//  Created by OITD on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var noteContent: UITextView!
    
    var note: Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
}
