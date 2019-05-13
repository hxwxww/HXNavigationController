//
//  DemoViewController.swift
//  HXNavigationController
//
//  Created by HongXiangWen on 2018/12/17.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var barAlphaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页\(navigationController!.viewControllers.count % 2)"
        if navigationController!.viewControllers.count % 2 == 0 {
//            hx_backgroundColor = .blue
//            hx_tintColor = .white
//            hx_titleColor = .white
//        } else {
            hx_backgroundColor = .white
            hx_tintColor = .red
            hx_titleColor = .red
            hx_barStyle = .default
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear: \(title!)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear: \(title!)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear: \(title!)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear: \(title!)")
    }
    
    @IBAction func barColorBtnClicked(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        hx_backgroundColor = color
    }
    
    @IBAction func barImageSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            let image = UIImage(named: "sunset")
            hx_backgroundImage = image
        } else {
            hx_backgroundImage = nil
        }
    }
    
    @IBAction func blackBarStyleSwitchChanged(_ sender: UISwitch) {
        hx_barStyle = sender.isOn ? .black : .default
    }
    
    @IBAction func shadowHiddenSwitchChanged(_ sender: UISwitch) {
        hx_shadowHidden = sender.isOn
    }
    
    @IBAction func barAlphaSliderChanged(_ sender: UISlider) {
        barAlphaLabel.text = String(format: "%.2f", sender.value)
        hx_barAlpha = CGFloat(sender.value)
    }
    
    @IBAction func tintColorBtnClicked(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        hx_tintColor = color
    }
    
    @IBAction func titleColorBtnClicked(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        hx_titleColor = color
    }
    
    @IBAction func pushToNext(_ sender: Any) {
        guard let demoVC = storyboard?.instantiateViewController(withIdentifier: "DemoViewController") else { return }
        navigationController?.pushViewController(demoVC, animated: true)
    }
    
    @IBAction func present(_ sender: Any) {
        guard let demoVC = storyboard?.instantiateViewController(withIdentifier: "DemoViewController") else { return }
        let nav = HXNavigationController(rootViewController: demoVC)
        present(nav, animated: true, completion: nil)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
