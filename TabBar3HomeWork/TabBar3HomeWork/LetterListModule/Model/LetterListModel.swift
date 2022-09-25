//
//  LetterListModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation

protocol LetterListModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

final class LetterListModel {
    
    weak var delegate: LetterListModelProtocol?
    var letters = [Letter]()
    
    func fetchData(){
        
        //Access to URL
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else{
            delegate?.didDataFetchProcessFinish(false)
            return
        }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        
        //Weak self define prevent for memory leak
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else{return} // escape from the optinal
            
            guard error == nil else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            guard statusCode >= 200, statusCode < 300
            else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            guard let data = data else {
                self.delegate?.didDataFetchProcessFinish(false)
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                self.letters = try jsonDecoder.decode([Letter].self, from: data) //get from data and send to letters
                self.delegate?.didDataFetchProcessFinish(true)
                
            } catch {
                self.delegate?.didDataFetchProcessFinish(false)
                print("erorrrrrr")
            }
        }
        task.resume() //run
    }
}
