//
//  Loader.swift
//  Git-Repositories-Search
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import UIKit

class Loader: NSObject {
    
    static var sharedViewSpinner: UIView?
    static let image = UIImage()
    
    class func show (onView: UIView, backGroundColor: UIColor? = .white) {
        if sharedViewSpinner != nil {
            sharedViewSpinner?.removeFromSuperview()
        }
        
        let spinnerView = UIView(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = backGroundColor
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        if #available(iOS 13.0, *) {
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = UIColor.gray
            activityIndicator.startAnimating()
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
        } else {
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.color = UIColor.gray
            activityIndicator.startAnimating()
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
            // Fallback on earlier versions
        }
        
        viewBackgroundLoading.center = spinnerView.center
        viewBackgroundLoading.backgroundColor = UIColor.white
        viewBackgroundLoading.alpha = 0.5
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15
        
        spinnerView.addSubview(viewBackgroundLoading)
        onView.addSubview(spinnerView)
        
        sharedViewSpinner = spinnerView
    }
    
    class func hide() {
        sharedViewSpinner?.removeFromSuperview()
        sharedViewSpinner = nil
    }
}
