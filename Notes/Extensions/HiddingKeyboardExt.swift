//
//  HiddingKeyboardExt.swift
//  Notes
//
//  Created by OITD on 23/09/23.
//

import Foundation
import UIKit

extension AddNoteViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
