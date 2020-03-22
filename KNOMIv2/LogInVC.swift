//
//  LogInVC.swift
//  KNOMIv2
//
//  Created by Aaron Peterson on 3/8/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    let testButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupButton()
    }
    
    func setupButton() {
        testButton.backgroundColor = .gray
        testButton.setTitleColor(.white, for: .normal)
        testButton.setTitle("TEST", for: .normal)
        
        testButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(testButton)
        setupButtonConstraints()
    }
    
    @objc func buttonTapped() {
        print("BUTTON TAPPED")
        let controller = CustomTabBarController()
        present(controller, animated: true, completion: nil)
    }
    
    func setupButtonConstraints() {
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        testButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
