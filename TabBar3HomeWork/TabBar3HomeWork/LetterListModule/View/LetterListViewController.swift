//
//  ViewController.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 21.09.2022.
//

import UIKit

class LetterListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let letterListViewModel = LetterListViewModel()
    
    var newLatter = [letterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        letterListViewModel.viewDelegate = self
        letterListViewModel.didViewLoad()
    }


}

private extension LetterListViewController {
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    func registerCell(){
        tableView.register(.init(nibName: "LetterListTableViewCell", bundle: nil), forCellReuseIdentifier: "LetterListTableViewCell")
    }
}

extension LetterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO
    }
    
}

extension LetterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newLatter.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LetterListTableViewCell", for: indexPath) as! LetterListTableViewCell
        let selectedLetter = newLatter[indexPath.row]
        cell.setupUI(selectedLetter)
        return cell
    }
}


extension LetterListViewController: LetterListViewModelProtocol {
    func didCellItemFetch(_ letters: [letterModel]) {
        self.newLatter = letters
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


private extension LetterListTableViewCell {
    func setupUI(_ letter: letterModel){
        self.titleLabel.text = letter.title
        self.bodyLabel.text = letter.body
    }
}
