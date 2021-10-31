//
//  ViewController.swift
//  SlideCardAppUI
//
//  Created by naksuk on 2021/10/31.
//

import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let cardView = CardView()
        self.view.addSubview(cardView)
        cardView.anchor(top: self.view.topAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, topPadding: 70, bottomPadding: 70, leftPadding: 20, rightPadding: 20)
    }


}

