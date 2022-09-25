//
//  ToDoListViewController.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit


class ToDoListViewController: UIViewController {
    
    //MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    private var newListArray = [ToDoListModuleEntity]()
    private var toDoListViewModelInstance = ToDoListViewModel()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        toDoListViewModelInstance.toDoListViewModelDelegate = self
        toDoListViewModelInstance.didViewLoad()
    }
    
    //MARK: - Functions
    @IBAction func goToAddToDoVC(_ sender: UIBarButtonItem) {
        let addToDoVC = storyboard?.instantiateViewController(withIdentifier: "addToDoVC") as! AddToDoViewController
        navigationController?.pushViewController(addToDoVC, animated: true)
    }
    
}

//MARK: - Extensions
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
        detailsToDoVC.toDoArray = newListArray[indexPath.row] //pass to data DetailsVC from here
        navigationController?.pushViewController(detailsToDoVC, animated: true)
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCell", for: indexPath) as! ToDoListTableViewCell
        let selectedItem = newListArray[indexPath.row]
        cell.dataUI(selectedItem)
        return cell

    }
}

extension ToDoListViewController {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            self.toDoListViewModelInstance.didSwipe(indexPath.row) //get data from the viewModel and Model
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

//Row Height
extension ToDoListViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0)
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
