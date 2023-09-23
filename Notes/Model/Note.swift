//
//  Note.swift
//  Notes
//
//  Created by OITD on 22/09/23.
//

import Foundation

struct Note: Encodable, Decodable {
    var title: String
    var content: String
    var date: Date
}
