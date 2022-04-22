//
//  ViewController.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let skeletonView = UIView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        skeletonView.layer.cornerRadius = 4
        self.view.addSubview(skeletonView)
        skeletonView.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(16)
            make.width.equalTo(200)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(8)
            make.centerY.equalToSuperview()
        }
        
        label.text = "sdhjajf gsam msdfkajgs df"
        label.textColor = .red
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(40)
            make.top.equalTo(skeletonView.snp.bottom).offset(12)
        }
        
        let button = UIButton()
        button.backgroundColor = UIColor(from: 0x5E8B7E)
        button.setTitle("Click here!!!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTouch), for: .touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(12)
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        skeletonView.startAnimation()
        label.startAnimation()
    }
    
    @objc func buttonDidTouch() {
        label.stopAnimation()
    }
}

