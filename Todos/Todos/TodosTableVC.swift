//
//  TodosVC.swift
//  Todos
//
//  Created by mac on 2022/7/10.
//

import UIKit

class TodosTableVC: UITableViewController {
    
    var todos:[Todo] = []
//    Todo(name: "旅游", checked: false),
//    Todo(name: "复习", checked: false),
//    Todo(name: "图书馆", checked: false),
//    Todo(name: "面试", checked: false),
//    Todo(name: "入职", checked: false)
    var row = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        //打印沙盒路径
        print(NSHomeDirectory())
        
//        if let data = UserDefaults.standard.data(forKey: kTodosKey){
//            if let todos = try? JSONDecoder().decode([Todo].self, from: data){
//                self.todos = todos
//            }else{
//                print("解码失败")
//            }
//        }//取数据
        let request = Todo.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: kOrderID, ascending: true)]
        
        if let todos = try? context.fetch(request){
            self.todos = todos
        }else{
            print("从SQLite里面取数据失败")
        }//固定用法取数据
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        editButtonItem.title = nil
        editButtonItem.image = pointIcon("arrow.up.arrow.down.circle.fill")
        
         navigationItem.leftBarButtonItem = editButtonItem
        
        navigationItem.rightBarButtonItem?.image = pointIcon("plus.circle.fill", 22)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if isEditing{
            editButtonItem.image = nil
            editButtonItem.title = "完成"
        }else{
            editButtonItem.title = nil
            editButtonItem.image = pointIcon("arrow.up.arrow.down.circle.fill")
        }
    }

    // MARK: - Table view data source

    

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    
    

    /*
    // Override to support rearranging the table view.
    
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kAddTodoID{
            let vc = segue.destination as! TodoTableVC
            vc.delegate = self
        }else if segue.identifier == kEditTodoID{
            let vc = segue.destination as! TodoTableVC
            vc.delegate = self
            let cell = sender as! TodoCell
            //cell-->indexpath
            //tableView.indexPath(for: cell)
            //indexpath-->cell
            //tableView.cellForRow(at: indexPath) as! TodoCell
            row = tableView.indexPath(for: cell)!.row
            vc.name = todos[row].name
        }
    }

}


