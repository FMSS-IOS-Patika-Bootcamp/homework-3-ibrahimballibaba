//
//  GalleryListViewController.swift
//  TabBar3HomeWork
//
//  Created by İbrahim Ballıbaba on 22.09.2022.
//

import UIKit
import Kingfisher

class GalleryListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Instance
    private let GalleryListViewModelInstance = GalleryListViewModel()
    private var photos = [PhotosModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        GalleryListViewModelInstance.viewDelegate = self
        GalleryListViewModelInstance.didViewLoad()
    }

}


private extension GalleryListViewController {
    func setupUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
    }
    
    //Register for collectionViewCell to this VC
    func registerCell(){
        collectionView.register(.init(nibName: "GalleryListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryListCollectionViewCell")
    }
}

extension GalleryListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO
    }
    
}

extension GalleryListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryListCollectionViewCell", for: indexPath) as! GalleryListCollectionViewCell
        if let url = photos[indexPath.row].url {
            let thisUrl = URL(string: url)
            cell.imageView.kf.setImage(with: thisUrl) //KingFisher for url convert to image
        }
        return cell
    }
}

extension GalleryListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 30) / 3, height: collectionView.frame.height / 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
    }
}


extension GalleryListViewController: GalleryListViewModelProtocol {
    func didCellFetchPhotos(_ photos: [PhotosModel]) {
        self.photos = photos
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
}
