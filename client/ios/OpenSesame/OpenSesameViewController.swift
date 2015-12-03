//
//  OpenSesameViewController.swift
//  OpenSesame
//
//  Created by Thad Hwang on 11/6/15.
//  Copyright © 2015 Thunderchicken Labs, LLC. All rights reserved.
//

import UIKit

class GradientColor {
  let colorTop = UIColor.fromRGB(COLOR_PRIMARY).CGColor
  let colorBottom = UIColor.whiteColor()
  
  let gl: CAGradientLayer
  
  init() {
    gl = CAGradientLayer()
    gl.colors = [ colorTop, colorBottom]
    gl.locations = [ 0.0, 1.0]
  }
}

class OpenSesameViewController: UIViewController {
  private var statusBar: UIView!
  private var topNavBar: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    let gradientColor = GradientColor()
    let backgroundLayer = gradientColor.gl
    let backgroundOffset = STATUS_BAR_HEIGHT+TOPNAV_BAR_SIZE
    backgroundLayer.frame = CGRect(x: 0.0, y: backgroundOffset, width: self.view.frame.width, height: self.view.frame.height-backgroundOffset)
    self.view.layer.insertSublayer(backgroundLayer, atIndex: 0)
    
    self.initTopNav()
  }
  
  // MARK: - Private methods
  private func initTopNav() {
    self.statusBar = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: STATUS_BAR_HEIGHT))
    self.statusBar.backgroundColor = UIColor.fromRGB(COLOR_PRIMARY)
    self.view.addSubview(self.statusBar)
    
    self.topNavBar = UIView(frame: CGRect(x: 0.0, y: self.statusBar.frame.maxY, width: self.view.frame.width, height: TOPNAV_BAR_SIZE))
    self.topNavBar.backgroundColor = UIColor.fromRGB(COLOR_PRIMARY)
    self.view.addSubview(self.topNavBar)
    
    let IMAGE_SIZE: CGFloat = TOPNAV_BAR_SIZE-OFFSET_SMALL
    let appLogo = UIImageView(image: UIImage(named: "img-logo"))
    appLogo.frame = CGRect(x: self.topNavBar.frame.width/2-IMAGE_SIZE/2, y: self.topNavBar.frame.height/2-IMAGE_SIZE/2, width: IMAGE_SIZE, height: IMAGE_SIZE)
    self.topNavBar.addSubview(appLogo)
  }

}

