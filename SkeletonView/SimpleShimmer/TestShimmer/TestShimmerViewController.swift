//
//  TestShimmerViewController.swift
//  SkeletonView
//
//  Created by Phuong Nguyen Lan on 4/7/22.
//

import Foundation
import UIKit

class TestShimmerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _1View = ShimmerView()
        _1View.layer.cornerRadius = 8
        view.addSubview(_1View)
        _1View.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(60)
        }
        
        let _2View = ShimmerView()
        view.addSubview(_2View)
        _2View.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(8)
            make.top.equalTo(_1View.snp.bottom).offset(16)
        }
        
        let _3View = ShimmerView()
        view.addSubview(_3View)
        _3View.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(16)
            make.top.equalTo(_2View.snp.bottom).offset(8)
        }
    }
}
