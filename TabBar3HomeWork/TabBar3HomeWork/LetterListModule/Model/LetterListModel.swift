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
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else{
            delegate?.didDataFetchProcessFinish(false)
            return
        }
        var request: URLRequest = .init(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in //weak self memory leak durumunu önlemek için tanımlanır. tüm closure lara yaz
            
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
                self.letters = try jsonDecoder.decode([Letter].self, from: data) //from daki datayı, [Post] arrayı type ına çevirme işlemini burada yapıyoruz.
                self.delegate?.didDataFetchProcessFinish(true)
                
            } catch {
                self.delegate?.didDataFetchProcessFinish(false)
                print("erorrrrrr")
            }
        }
        task.resume()
    }
}
