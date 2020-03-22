//
//  PhotosContainerView.swift
//  KNOMIv2
//
//  Created by Aaron Peterson on 1/1/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class PhotosContainerView: UIViewController {
    
    var profilePhotos = ["Alcohol", "Bonfire", "Food", "Friends1", "Friends2", "Friends3", "Hiking", "Surfing"]
    
    let collView: UICollectionView = {
        let numberOfItemsPerRow: CGFloat = 3
        let lineSpacing: CGFloat = 1
        let interItemSpacing: CGFloat = 1
         
        let width = (414 - (numberOfItemsPerRow - 1) * interItemSpacing) / numberOfItemsPerRow
        let height = width
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets.zero
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interItemSpacing
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: "cellId")
        
        cv.setCollectionViewLayout(layout, animated: true)
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collView)
        collView.backgroundColor = .brown
        collView.delegate = self
        collView.dataSource = self
        collView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let viewWidth = self.view.bounds.width
        print(viewWidth)
    }

}

extension PhotosContainerView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profilePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PhotoCell
        cell.photoImage.image = UIImage(named: profilePhotos[indexPath.item])
        return cell
    }
    
}

class PhotoCell: BaseCell {
    
    let photoImage = UIImageView()
    
    func setupPhotoImage() {
        addSubview(photoImage)
        photoImage.contentMode = .scaleAspectFill
        photoImage.layer.masksToBounds = true
        setupPhotoImageConstraints()
    }
    
    func setupPhotoImageConstraints() {
        addConstraintsWithFormat(format: "H:|[v0]|", views: photoImage)
        addConstraintsWithFormat(format: "V:|[v0]|", views: photoImage)
    }
    
    override func setupViews() {
        setupPhotoImage()
    }
}

