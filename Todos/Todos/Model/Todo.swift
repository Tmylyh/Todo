//
//  Todo.swift
//  Todos
//
//  Created by mac on 2022/7/10.
//

import Foundation

//class Todo{
//    var name = ""
//    var checked = ""
//}

struct Todo: Encodable, Decodable {//为了可以encoder可编码,可直接用Codable
    var name: String
    var checked: Bool
}
