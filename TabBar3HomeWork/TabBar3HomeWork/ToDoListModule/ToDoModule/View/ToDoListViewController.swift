//
//  ToDoListViewController.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit
import CoreData


class ToDoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var newListArray = [NewListToDoArray]()
    private var toDoListViewModelInstance = ToDoListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

      //  setupUI()
      //  toDoListViewModelInstance.toDoListViewModelDelegate = self
      //  toDoListViewModelInstance.didViewLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        toDoListViewModelInstance.toDoListViewModelDelegate = self
        toDoListViewModelInstance.didViewLoad()
    }
    @IBAction func goToAddToDoVC(_ sender: UIBarButtonItem) {
        let addToDoVC = storyboard?.instantiateViewController(withIdentifier: "addToDoVC") as! AddToDoViewController
        navigationController?.pushViewController(addToDoVC, animated: true)
    }
    
   
    
}

private extension ToDoListViewController {
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    func registerCell(){
        tableView.register(.init(nibName: "ToDoListTableViewCell", bundle: nil), forCellReuseIdentifier: "ToDoListTableViewCell")
    }
}

extension ToDoListViewController: UITableViewDelegate {
    
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCell", for: indexPath) as! ToDoListTableViewCell
        cell.dataUI(newListArray[indexPath.row])
        return cell
    }
    
    
}

extension ToDoListViewController: ToDoListViewModelProtocol {
    func didCellFetchToDo(_ toDo: [NewListToDoArray]) {
        self.newListArray = toDo
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}


private extension ToDoListTableViewCell {
    func dataUI(_ model: NewListToDoArray){
        titleLabel.text = model.title
    }
}
