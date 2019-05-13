//
//  BarHiddenViewController.swift
//  HXNavigationController
//
//  Created by HongXiangWen on 2019/5/13.
//  Copyright © 2019 WHX. All rights reserved.
//

import UIKit

class BarHiddenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hx_barAlpha = 0
        hx_tintColor = .clear
        hx_titleColor = .clear
        hx_barStyle = .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func back() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func nextVC() {
        guard let demoVC = storyboard?.instantiateViewController(withIdentifier: "DemoViewController") else { return }
        navigationController?.pushViewController(demoVC, animated: true)
    }
}
