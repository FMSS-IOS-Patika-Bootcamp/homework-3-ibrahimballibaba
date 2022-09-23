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
    private var newListArray = [ToDoListModuleEntity]()
    private var toDoListViewModelInstance = ToDoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsToDoVC = storyboard?.instantiateViewController(withIdentifier: "detailsToDoVC") as! DetailsToDoViewController
        detailsToDoVC.toDoArray = newListArray[indexPath.row]
        navigationController?.pushViewController(detailsToDoVC, animated: true)
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCell", for: indexPath) as! ToDoListTableViewCell
        
        
        if newListArray[indexPath.row].isCompleted{
            cell.titleLabel.text = newListArray[indexPath.row].title
            cell.switchImage.image = UIImage(systemName: "checkmark.seal.fill")
            return cell
        }else{
            cell.titleLabel.text = newListArray[indexPath.row].title
            cell.switchImage.image = UIImage(systemName: "checkmark.seal")
            return cell
        }
    }
    
    
}

extension ToDoListViewController {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            self.toDoListViewModelInstance.didSwipe(indexPath.row)
            // Remove data
            self.newListArray.remove(at: indexPath.row)
            // reload to tableView
            tableView.reloadData()
            complete(true)
        }
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipe
    }
}

extension ToDoListViewController: ToDoListViewModelProtocol {
    func didCellFetchToDo(_ toDo: [ToDoListModuleEntity]) {
        self.newListArray = toDo
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}


//private extension ToDoListTableViewCell {
//    func dataUI(_ model: NewListToDoArray){
//        titleLabel.text = model.title
//    }
//}
