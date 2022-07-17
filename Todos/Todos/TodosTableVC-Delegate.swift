//
//  TodosTableVC-Dalegate.swift
//  Todos
//
//  Created by mac on 2022/7/11.
//

import UIKit

extension TodosTableVC{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: kTodoTableVCID) as! TodoTableVC//在storyboar上找制作好的vc
//        navigationController?.pushViewController(vc, animated: true)
    }

//    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "点击以删除"
//    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if !isEditing{
            return .delete
        }else{
        return .none
    }
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension TodosTableVC: TodoTableVCDelegate{
    func didAdd(name: String) {
        
        todos.append(Todo(name: name, checked: false))
        
        tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .automatic)
//        tableView.reloadData()
    }
    func didEdit(name: String) {
        todos[row].name = name
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        cell.todoLabel.text = name
        tableView.reloadData()
    }
}
