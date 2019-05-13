//
//  ProfileViewController.swift
//  HXNavigationController
//
//  Created by HongXiangWen on 2018/12/18.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    @IBOutlet weak var header: UIView!
    @IBOutlet weak var headerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        let headerFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width * 0.75)
        header.frame = headerFrame
        headerView.frame = headerFrame
        hx_backgroundColor = .cyan
        hx_barAlpha = 0
        hx_tintColor = .white
        hx_titleColor = UIColor(white: 0, alpha: 0)
        hx_shadowHidden = true
    }
    
    private func adjustHeaderFrame() {
        var imageWidth = view.bounds.width
        var imageHeight = imageWidth * 0.75
        var originY: CGFloat = 0
        let contentOffsetY = tableView.contentOffset.y
        if contentOffsetY < 0 {
            originY += contentOffsetY
            imageHeight -= contentOffsetY
            imageWidth = imageHeight / 0.75
        }
        let headViewFrame = CGRect(x: (view.bounds.width - imageWidth) / 2, y: originY, width: imageWidth, height: imageHeight)
        headerView.frame = headViewFrame
    }
    
    @IBAction func popToRoot(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "个人中心 \(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let barHiddenVC = storyboard?.instantiateViewController(withIdentifier: "BarHiddenViewController") else { return }
        navigationController?.pushViewController(barHiddenVC, animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerHeight = view.bounds.width * 0.75
        let contentOffsetY = scrollView.contentOffset.y
        let progress = min(1, max(0, contentOffsetY / headerHeight))
        if progress < 0.1 {
            hx_barStyle = .black
            hx_tintColor = .white
            hx_titleColor = UIColor(white: 0, alpha: 0)
        } else {
            hx_barStyle = .default
            hx_tintColor = UIColor(white: 0, alpha: progress)
            hx_titleColor = UIColor(white: 0, alpha: progress)
        }
        hx_barAlpha = progress
        adjustHeaderFrame()
    }
    
}
