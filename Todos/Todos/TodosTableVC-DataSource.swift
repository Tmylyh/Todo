//
//  TodosTableVC-DataSource.swift
//  Todos
//
//  Created by mac on 2022/7/11.
//

import UIKit

extension TodosTableVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTodoCellID, for: indexPath) as! TodoCell
        todos[indexPath.row].orderID = Int16(indexPath.row)
        appDelegate.saveContext()//根据内存中排好的顺序赋值
        
        let checkBoxBtn = cell.checkBoxBtn!
        let todoLabel = cell.todoLabel!
        let initSelected = todos[indexPath.row].checked
//        var contentConfiguration = cell.defaultContentConfiguration()
//        contentConfiguration.text = "昵称"
//        contentConfiguration.secondaryText = "个性签名"
//        contentConfiguration.image = UIImage(systemName: "star")
//        cell.contentConfiguration = contentConfiguration
        // Configure the cell...
        
        
        checkBoxBtn.isSelected = initSelected
        todoLabel.text = todos[indexPath.row].name
        todoLabel.textColor = initSelected ? .tertiaryLabel : .label
        
        //改
//        checkBoxBtn.addAction(UIAction(handler: { action in
//            self.todos[indexPath.row].checked.toggle()
//            let checked = self.todos[indexPath.row].checked
//            checkBoxBtn.isSelected = checked
//            todoLabel.textColor = checked ? .tertiaryLabel : .label
//        }), for: .touchUpInside)
        checkBoxBtn.tag = indexPath.row
    
        checkBoxBtn.addTarget(self, action: #selector(toggleCheck), for: .touchUpInside)
        
        
        
        return cell
    }
    
    @objc func toggleCheck(checkBoxBtn: UIButton){
      //  改
        let row = checkBoxBtn.tag
            self.todos[row].checked.toggle()
        
        //saveData()
        appDelegate.saveContext()
            let checked = self.todos[row].checked
            checkBoxBtn.isSelected = checked
        let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! TodoCell
        cell.todoLabel.textColor = checked ? .tertiaryLabel : .label
    }
    
    // Override to support editing the table view.删
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            context.delete(todos[indexPath.row])//先删除本地，再删除内存，本地通过内存找到
            todos.remove(at: indexPath.row)
            appDelegate.saveContext()
//            tableView.deleteRows(at: [indexPath], with: .fade)
            //saveData()
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        let todoToRemove = todos[fromIndexPath.row]
        todos.remove(at: fromIndexPath.row)
        todos.insert(todoToRemove, at: to.row)
        //saveData()
        
        tableView.reloadData()
    }
}



