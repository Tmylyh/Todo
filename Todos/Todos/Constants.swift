//
//  Constants.swift
//  Todos
//
//  Created by mac on 2022/7/10.
//

import Foundation
import UIKit

let kTodoTableVCID = "TodoTableVCID"
let kTodoCellID = "TodoCellID"
let kAddTodoID = "AddTodoID"
let kEditTodoID = "EditTodoID"
let kTodosKey = "TodosKey"
let kOrderID = "orderID"

func pointIcon(_ iconName: String, _ pointSize: CGFloat = 22) -> UIImage?{
    let config = UIImage.SymbolConfiguration(pointSize:  pointSize)
    return UIImage(systemName:  iconName, withConfiguration:  config)
}
