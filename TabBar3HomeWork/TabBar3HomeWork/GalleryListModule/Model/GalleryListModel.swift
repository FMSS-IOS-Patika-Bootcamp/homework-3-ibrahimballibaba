//
//  GalleryListModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation

protocol GalleryListModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

final class GalleryListModel {
    
    weak var delegate: GalleryListModelProtocol?
    
    var photosAPI = [Photos]()
    
            func fetcData(){
                
                //Access to URL
                guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else {
                    delegate?.didDataFetchProcessFinish(false)
                    return
                }
                
                var urlRequest: URLRequest = .init(url: url)
                urlRequest.httpMethod = "GET"
                
                //Weak self define prevent for memory leak
                let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
                    
                    
                    guard let self = self else{return} // escape from the optinal
                    
                    guard error == nil else{
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
                    
                    do{
                       // let jsonDecoder = JSONDecoder()
                        self.photosAPI = try JSONDecoder().decode([Photos].self, from: data) //get from data and send to Photos
                        self.delegate?.didDataFetchProcessFinish(true)
                    } catch {
                        self.delegate?.didDataFetchProcessFinish(false)
                            print("Error")
                    }
                }
                
                task.resume() //run
            }
}
