//
//  ProfileViewController.swift
//  Everest_iOS
//
//  Created by Sathoshi Kumarawadu on 2016-12-11.
//  Copyright © 2016 Everest. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController{
  
  private let headerAndStackView = HeaderAndStackViewContainer(withNavigationBar: true)
  private var profileHeaderContainer = ProfileHeaderContainer(110)
  private var profileStats = ProfileStatsContainer()
  private var userName = UILabel()
  
  let tags = ["Tech", "Designrdafd", "Humor", "Travel", "Music", "Writing"]
  
  let bleh = ["Software", "Hardware", "IoT", "Robotocs"]
  
  let bleh1 = ["University of Waterloo", "UoFT", "Guelf"]
  let bleh2 = ["Azure", "AWS", "Google Servers"]
  let bleh3 = ["SathoshiK.com"]
  
  var abcd : [[String]]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.hideKeyboardWhenTappedAround()
    let appStyle = AppStyle.sharedInstance
    profileHeaderContainer.pictureImageView.downloadedFrom(link: t("/public/uploads/toronto7.png"))
    
    abcd = [tags, bleh, bleh1, bleh2, bleh3]
    
    headerAndStackView.setHeaderView(view: profileHeaderContainer)
    
    headerAndStackView.addArrangedSubviewToStackView(view: userName)
    headerAndStackView.addArrangedSubviewToStackView(view: profileStats)
    
    //SKU - Enable scrolling
    enableViewScrolling()
    
    //SKU - Load all characterics
    loadUserCharacteristics()
    
    self.view.addSubview(headerAndStackView)
    
    setupConstraints()
    adjustBackgroundColor()
  }
  
  func setupConstraints() {
    
    headerAndStackView.translatesAutoresizingMaskIntoConstraints = false
    headerAndStackView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    headerAndStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    headerAndStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    headerAndStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    
    profileStats.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    userName.text = "Sathoshi Kumarawawdu"
    userName.font = AppStyle.sharedInstance.headerFontLarge25Light
  }
  
  func adjustBackgroundColor() {
    headerAndStackView.headerView.backgroundColor = UIColor.white
    headerAndStackView.contentView.sideBorder(side: .top, width: 0, colour: UIColor.white)
    headerAndStackView.contentView.backgroundColor = UIColor.white
  }
  
  func loadUserCharacteristics() {
    
    for i in 0...((abcd?.count)!-1) {
      let test = TagFlowController()
      test.loadData(inputValues: (abcd?[i])!)
      test.setTitle(title: "Random Tags")
      addChildViewController(test)
      headerAndStackView.addArrangedSubviewToStackView(view: test.view)
      test.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
  }
  
  func enableViewScrolling() {
    headerAndStackView.contentViewHeightConstraint = headerAndStackView.contentView.heightAnchor.constraint(equalTo: headerAndStackView.baseInputView.stackView.heightAnchor, constant: 80)
    headerAndStackView.contentViewHeightConstraint?.isActive = true
  }
}
