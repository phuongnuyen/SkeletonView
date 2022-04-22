//
//  TestSkeletonViewController.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import Foundation
import UIKit
import SnapKit

class TestSkeletonViewController: UIViewController {
    private var img1: UIImageView?
    private var label1: UILabel?
    private var img2: UIImageView?
    private var label2: UILabel?
    private var img3: UIImageView?
    private var label3: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.spacing = 24
        containerView.alignment = .center
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        let result1 = createGroup()
        let group1 = result1.groupView
        group1.backgroundColor = UIColor(from: 0x42C2FF)
        containerView.addArrangedSubview(group1)
        let config1 = SkeletonConfig(direction: .leftToRight)
        img1 = result1.imgView
        img1?.skeletonConfig = config1
        label1 = result1.lbl
        label1?.skeletonConfig = config1

        let result2 = createGroup()
        let group2 = result2.groupView
        group2.backgroundColor = UIColor(from: 0xEBD8C3)
        containerView.addArrangedSubview(group2)
        let config2 = SkeletonConfig(direction: .rightToLeft)
        img2 = result2.imgView
        img2?.skeletonConfig = config2
        label2 = result2.lbl
        label2?.skeletonConfig = config2
        
        let result3 = createGroup()
        let group3 = result3.groupView
        group3.backgroundColor = UIColor(from: 0x363062)
        containerView.addArrangedSubview(group3)
        let config3 = SkeletonConfig(direction: .topLeftToBottomRight)
        img3 = result3.imgView
        img3?.skeletonConfig = config3
        label3 = result3.lbl
        label3?.skeletonConfig = config3
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.startAnimation()
        self.startTimmer()
    }
    
    private func createGroup() -> (groupView: UIView, imgView: UIImageView, lbl: UILabel) {
        let group = UIView()
        group.layer.cornerRadius = 8
        
        let imgView = UIImageView()
        imgView.enableSkeleton = true
        group.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.size.equalTo(120)
        }
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.enableSkeleton = true
        group.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-16)
            make.top.equalTo(imgView.snp.bottom).offset(8)
            make.height.equalTo(14)
        }
        return (group, imgView, label)
    }
    
    private func startTimmer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.img1?.image = UIImage(named: "img1.jpeg")
            self.label1?.text = "image 1"
            self.img2?.image = UIImage(named: "img2.jpeg")
            self.label2?.text = "image 2"
            self.img3?.image = UIImage(named: "img3.jpeg")
            self.label3?.text = "image 3"
            self.view.stopAnimation()
        }
    }
}
