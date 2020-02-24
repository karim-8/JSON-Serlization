//
//  Petition.swift
//  Json-Serlization
//
//  Created by KARIM on 2/23/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import Foundation

struct Petition:Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

struct Petitions:Codable {
    var results: [Petition]
}
