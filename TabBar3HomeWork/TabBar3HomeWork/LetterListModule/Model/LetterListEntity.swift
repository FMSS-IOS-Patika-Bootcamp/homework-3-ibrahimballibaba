//
//  LetterListEntity.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation

//This area our entity
struct letterModel {
    var title: String?
    var body: String?
}

//API data
struct Letter: Decodable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
