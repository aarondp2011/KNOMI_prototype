//
//  UserProfileViewController.swift
//  KNOMIv2
//
//  Created by Aaron Peterson on 12/26/19.
//  Copyright © 2019 Aaron Peterson. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let backButton = UIButton()
    let nameLabel = UILabel()
    let blockButton = UIButton()
    let profileImageView = UIImageView()
    let taglineLabel = UILabel()
    let chatButton = UIButton()
    let menuBar = MenuBar()
    let userInfoContainerView = UserInfoContainerView()
    let photosContainerView = PhotosContainerView()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        setupBackButton()
        setupNameLabel()
        setupBlockButton()
        setupProfileImageView()
        setupTaglineLabel()
        setupChatButton()
        setupMenuBar()
        setupUserInfoContainerView()
    }
    
    func setupBackButton() {
        backButton.backgroundColor = .gray
        backButton.setTitleColor(.white, for: .normal)
        backButton.setTitle("Back", for: .normal)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        setupBackButtonConstraints()
    }
    
    @objc func backButtonTapped() {
        print("BACK BUTTON TAPPED")
        self.dismiss(animated: true)
    }
    
    func setupBackButtonConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupNameLabel() {
        nameLabel.backgroundColor = .cyan
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.text = "NAME"
        view.addSubview(nameLabel)
        setupNameLabelConstraints()
    }
    
    func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupBlockButton() {
        blockButton.backgroundColor = .gray
        blockButton.setTitleColor(.white, for: .normal)
        // Add Block Image
        blockButton.setTitle("Blk", for: .normal)
        
        blockButton.addTarget(self, action: #selector(blockButtonTapped), for: .touchUpInside)
        
        view.addSubview(blockButton)
        setupBlockButtonConstraints()
    }
    
    func setupBlockButtonConstraints() {
        blockButton.translatesAutoresizingMaskIntoConstraints = false
        blockButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        blockButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        blockButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        blockButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc func blockButtonTapped() {
        print("Block Button Tapped")
    }
    
    func setupProfileImageView() {
        guard let photo = user?.imageName else { return }
        if let photoName = UIImage(named: photo) {
            profileImageView.image = photoName
        }
        view.addSubview(profileImageView)
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        setupProfileImageConstraints()
    }
    
    func setupProfileImageConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupTaglineLabel() {
        taglineLabel.backgroundColor = .purple
        taglineLabel.textColor = .white
        taglineLabel.text = "TAGLINE"
        view.addSubview(taglineLabel)
        setupTaglineLabelConstraints()
    }
    
    func setupTaglineLabelConstraints() {
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        taglineLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 25).isActive = true
        taglineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        taglineLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        taglineLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupChatButton() {
        chatButton.backgroundColor = .green
        chatButton.setTitleColor(.white, for: .normal)
        chatButton.setTitle("CHAT", for: .normal)
        
        chatButton.addTarget(self, action: #selector(chatButtonTapped), for: .touchUpInside)
        
        view.addSubview(chatButton)
        setupChatButtonConstraints()
    }
    
    @objc func  chatButtonTapped() {
        let alert = UIAlertController(title: "Notification Sent", message: "A notification was sent.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: { self.disableButton() })
        print("CHAT BUTTON TAPPED")
    }
    
    func setupChatButtonConstraints() {
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        chatButton.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 25).isActive = true
        chatButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        chatButton.widthAnchor.constraint(equalToConstant: 83).isActive = true
        chatButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupMenuBar() {
        menuBar.containerViewDelegate = self
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        menuBar.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    func setupUserInfoContainerView() {
        addChild(userInfoContainerView)
        view.addSubview(userInfoContainerView.view)
        userInfoContainerView.didMove(toParent: self)
        setupUserInfoContainerViewConstraints()
    }
    
    func setupUserInfoContainerViewConstraints() {
        userInfoContainerView.view.translatesAutoresizingMaskIntoConstraints = false
        userInfoContainerView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        userInfoContainerView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        userInfoContainerView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        userInfoContainerView.view.topAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupPhotosContainerView() {
        addChild(photosContainerView)
        view.addSubview(photosContainerView.view)
        photosContainerView.didMove(toParent: self)
        setupPhotosContainerViewConstraints()
    }
    
    func setupPhotosContainerViewConstraints() {
        photosContainerView.view.translatesAutoresizingMaskIntoConstraints = false
        photosContainerView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        photosContainerView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        photosContainerView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        photosContainerView.view.topAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: 0).isActive = true
    }
    
    func disableButton() {
        chatButton.isEnabled = false
        chatButton.backgroundColor = .red
        chatButton.setTitle("SENT", for: .normal)
    }
    
}

extension UserProfileViewController: ShowContainerViewDelegate {
    func menuBarTapped(indexPath: IndexPath) {
        print("USER PROFILE CONTAINER VIEW!!!!!!")
        if indexPath.item == 0 {
            setupUserInfoContainerView()
        } else {
            setupPhotosContainerView()
        }
    }
}


