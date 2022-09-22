//
//  ToDoListViewController.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
