//
//  UserInfoContainerView.swift
//  KNOMIv2
//
//  Created by Aaron Peterson on 1/1/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class UserInfoContainerView: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        view.backgroundColor = .cyan
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(InterestCell.self, forCellReuseIdentifier: "InterestCell")
        setupTableViewConstraints()
    }
    
    func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

extension UserInfoContainerView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestCell") as! InterestCell
        return cell
    }
    
}

class InterestCell: UITableViewCell {
    
    var interestTitleLabel = UILabel()
    var interestInfoLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupInterestTitleLabel()
        setupInterestInfoLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInterestTitleLabel() {
        addSubview(interestTitleLabel)
        interestTitleLabel.backgroundColor = .yellow
        interestTitleLabel.textColor = .black
        interestTitleLabel.textAlignment = .left
        interestTitleLabel.text = "Interest"
        setupInterestTitleLabelConstraint()
    }
    
    func setupInterestTitleLabelConstraint() {
        interestTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        interestTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        interestTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        interestTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        interestTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupInterestInfoLabel() {
        addSubview(interestInfoLabel)
        interestInfoLabel.backgroundColor = .cyan
        interestInfoLabel.textColor = .black
        interestInfoLabel.textAlignment = .left
        interestInfoLabel.text = "Interest Details"
        setupInterestInfoLabelConstraint()
    }
    
    func setupInterestInfoLabelConstraint() {
        interestInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        interestInfoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 42).isActive = true
        interestInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        interestInfoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        interestInfoLabel.widthAnchor.constraint(equalToConstant: 325).isActive = true
    }
    
}
