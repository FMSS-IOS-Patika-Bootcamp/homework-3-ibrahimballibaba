//
//  PostListViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation

protocol LetterListViewModelProtocol: AnyObject {
    func didCellItemFetch(_ letters: [letterModel])
}


final class LetterListViewModel {
    
    weak var viewDelegate: LetterListViewModelProtocol?
    private let letterListModel = LetterListModel()
    
    init(){
        letterListModel.delegate = self
    }
    
    func didViewLoad(){
        letterListModel.fetchData()
    }
}

private extension LetterListViewModel {
    
    @discardableResult
    func makeViewBaseModel(_ letter: [Letter]) -> [letterModel]{
        return letter.map{.init(title: $0.title, body: $0.body)}
    }
}

extension LetterListViewModel: LetterListModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess{
            let letter = letterListModel.letters
            viewDelegate?.didCellItemFetch(makeViewBaseModel(letter))
        } else {
            print("errorrr")
        }
    }
}
