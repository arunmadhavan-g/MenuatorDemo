//
//  ViewController.swift
//  MenuatorDemo
//
//  Created by Arun Madhavan Govindarajan on 21/03/18.
//  Copyright © 2018 AMG. All rights reserved.
//

import Menuator
import Foundation
import UIKit


public class ViewController: UIViewController {
    
    public let menuator = Menuator()
    public var menuatorView: MenuatorView!
    
    public let menuatorTopPadding: CGFloat = 150
    public let menuatorHeight: CGFloat = 46
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(1)
        
        menuator.add(menuItem: "Menu1")
        menuator.add(menuItem: "Menu2")
        menuator.add(menuItem: "Menu3")
        menuator.add(menuItem: "Menu4")
        
        menuator.leftMarginOffset = 86
        menuator.floatViewHeight = 4
        menuator.floatViewColor = .white
        menuator.lineViewHeight = 2
        menuator.lineViewColor = .gray
        menuator.roundedCorners = true
        menuator.sidePadding = 0
        
        menuatorView = MenuatorView(menuator: menuator)
        menuatorView.delegate = self
        menuatorView.dataSource = self
        
        view.addSubview(menuatorView)
        view.addSubview(menuator)
        
        menuatorView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        menuator.snp.makeConstraints { (make) in
            make.top.equalTo(menuatorTopPadding)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(menuatorHeight)
        }
    }
    
}

// MARK: - Menuator content view delegate & data source methods

extension ViewController: MenuatorViewDelegate, MenuatorViewDataSource {
    public func didScrollTo(index: Int, menuatorView: MenuatorView) {
        // Nothing to implement here.
    }
    
    
    public func page(index: Int, menuatorView: MenuatorView) -> UIView {
        let label = UILabel();
        label.text = ["Page1 Content", "Page2 Content", "Page3 Content", "Page4 Content"][index];
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }
}

