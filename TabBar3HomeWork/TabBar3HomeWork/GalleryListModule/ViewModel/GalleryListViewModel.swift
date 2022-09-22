//
//  GalleryListViewModel.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import Foundation

protocol GalleryListViewModelProtocol: AnyObject {
    func didCellFetchPhotos(_ photos: [PhotosModel])
}

final class GalleryListViewModel {
    
    weak var viewDelegate: GalleryListViewModelProtocol?
    
    private var galleryListModelInstance = GalleryListModel()
    
    init(){
        galleryListModelInstance.delegate = self
    }
    
    func didViewLoad(){
        galleryListModelInstance.fetcData()
    }
    
}

private extension GalleryListViewModel {
    @discardableResult
    func makeViewBaseModel(_ photos: [Photos]) -> [PhotosModel]{
        return photos.map{.init(id: $0.id, url: $0.url)}
    }
}

extension GalleryListViewModel: GalleryListModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let photos = galleryListModelInstance.photosAPI.filter{$0.id < 101}
            viewDelegate?.didCellFetchPhotos(makeViewBaseModel(photos))
            
        } else {
            print("Error2")
        }
    }
    
    
}
