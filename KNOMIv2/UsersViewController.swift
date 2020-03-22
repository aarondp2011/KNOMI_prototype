//
//  ViewController.swift
//  KNOMIv2
//
//  Created by Aaron Peterson on 12/26/19.
//  Copyright © 2019 Aaron Peterson. All rights reserved.
//

import UIKit

class UsersViewController: UICollectionViewController {
    
    private let cellId = "cellId"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var userProfiles: [User] = [User(imageName: "pic1"), User(imageName: "pic2"), User(imageName: "pic3"), User(imageName: "pic4"), User(imageName: "pic5"), User(imageName: "pic6"), User(imageName: "pic7"), User(imageName: "pic8"), User(imageName: "pic9"), User(imageName: "pic10"), User(imageName: "pic11"), User(imageName: "pic12"), User(imageName: "pic13"), User(imageName: "pic14"), User(imageName: "pic15"), User(imageName: "pic16"), User(imageName: "pic17"), User(imageName: "pic18"), User(imageName: "pic19"), User(imageName: "pic20"), User(imageName: "pic21"), User(imageName: "pic22"), User(imageName: "pic23"), User(imageName: "pic24"), User(imageName: "pic25"), User(imageName: "pic26"), User(imageName:"pic27")]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Near You"
        
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(UserProfileCell.self, forCellWithReuseIdentifier: cellId)
        
        setupCollectionViewItemSize()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userProfiles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserProfileCell
        cell.userProfileImage.image = UIImage(named: userProfiles[indexPath.item].imageName)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)")
        
        let controller = UserProfileViewController()
        controller.user = userProfiles[indexPath.item]
        //navigationController?.pushViewController(controller, animated: true)
        navigationController?.modalPresentationStyle = .overFullScreen
        navigationController?.present(controller, animated: true)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemsPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 1
            let interItemSpacing: CGFloat = 1
            
            let width = (collectionView.frame.width - (numberOfItemsPerRow - 1) * interItemSpacing) / numberOfItemsPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
}

class UserProfileCell: BaseCell {
    
    let userProfileImage = UIImageView()
    
    func setupUserProfileImage() {
        addSubview(userProfileImage)
        userProfileImage.contentMode = .scaleAspectFill
        userProfileImage.layer.masksToBounds = true
        setupUserProfileImageConstraints()
    }
    
    func setupUserProfileImageConstraints() {
        addConstraintsWithFormat(format: "H:|[v0]|", views: userProfileImage)
        addConstraintsWithFormat(format: "V:|[v0]|", views: userProfileImage)
    }
    
    override func setupViews() {
        setupUserProfileImage()
    }
}



