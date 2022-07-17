//
//  TodoTableVC.swift
//  Todos
//
//  Created by mac on 2022/7/10.
//

import UIKit

protocol TodoTableVCDelegate{
    func didAdd(name: String)
    func didEdit(name: String)
}

class TodoTableVC: UITableViewController, UITextViewDelegate {

    var delegate: TodoTableVCDelegate?
    var name:String?
    
    
    @IBOutlet weak var todoTextView: UITextView!
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        if !todoTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            if name != nil{
                delegate?.didEdit(name: todoTextView.text)
            }else{
                delegate?.didAdd(name: todoTextView.text)
            }
        }
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoTextView.becomeFirstResponder()
        todoTextView.delegate = self
        
        todoTextView.text = name
        
        if name != nil{
            navigationItem.title = "编辑待办事项"
        }
        
        navigationItem.leftBarButtonItem?.image = pointIcon("chevron.backward.circle.fill")
        navigationItem.rightBarButtonItem?.image = pointIcon("checkmark.circle.fill")
    }


}

extension TodoTableVC{
    func textViewDidChange(_ textView: UITextView) {
//        tableView.beginUpdates()
//        tableView.endUpdates()
        tableView.performBatchUpdates { }
    }
}
