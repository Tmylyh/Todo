//
//  TodosTable-storage.swift
//  Todos
//
//  Created by mac on 2022/7/18.
//

import UIKit

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext//得到appDelegat对象获取容器内容
let appDelegate = (UIApplication.shared.delegate as! AppDelegate)

extension TodosTableVC{
//    func saveData(){
//        //本地存储
//        do{
//          let data = try JSONEncoder().encode(todos)
//            UserDefaults.standard.set(data, forKey: kTodosKey)//由于是Todo类型所以无法存进plist文件，需转data类型，用json编码
//        }catch{
//            print("编码错误")
//        }
//    }
}
