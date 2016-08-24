//
//  DemoCell.swift
//  HTPopoverMenu
//
//  Created by Hoang Tran on 8/24/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public class HTPopoverMenu : UIViewController {

  public override func loadView() {
    super.loadView()
    self.view.addSubview(darkView)
  }

  lazy var darkView: UIView = {
    let screenSize = UIScreen.mainScreen().bounds.size
    let view = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
    view.backgroundColor = UIColor.blackColor()
    view.layer.opacity = 0.5
    view.translatesAutoresizingMaskIntoConstraints = true
    view.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin, .FlexibleWidth, .FlexibleHeight]
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapDarkView)))
    return view
  }()

}

// public interface
extension HTPopoverMenu {

  public func showFromView(view: UIView) {
    UIApplication.sharedApplication().keyWindow?.addSubview(self.view)
  }

  public func hide() {
    self.view.removeFromSuperview()
  }

}

// event handling
extension HTPopoverMenu {

  func onTapDarkView(tapGesture: UITapGestureRecognizer) {
    hide()
  }

}