//
//  DemoCell.swift
//  HTPopoverMenu
//
//  Created by Hoang Tran on 8/24/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public class HTPopoverMenu : UIViewController {

  var menuHeight: CGFloat = 200

  public override func loadView() {
    super.loadView()
    self.view.addSubview(darkView)
    self.view.addSubview(popoverContainerView)
  }

  lazy var darkView: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: self.window.bounds.size.width, height: self.window.bounds.size.height))
    view.backgroundColor = UIColor.blackColor()
    view.layer.opacity = 0.5
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapDarkView)))
    return view
  }()

  lazy var popoverContainerView: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: self.window.bounds.size.width, height: self.menuHeight))
    view.backgroundColor = UIColor.whiteColor()
    self.menuTableView.frame.size = view.bounds.size
    view.addSubview(self.menuTableView)
    return view
  }()

  lazy var menuTableView: UITableView = {
    let tableView = UITableView(frame: CGRectZero, style: .Plain)
    tableView.bounces = false
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()

  lazy var window: UIWindow = {
    return UIApplication.sharedApplication().keyWindow!
  }()
}

// public interface
extension HTPopoverMenu {
  public func showFromView(view: UIView) {
    window.addSubview(self.view)
    updatePopoverPositionFromView(view)
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

let menuCellReuseID = "menuCellReuseID"

extension HTPopoverMenu : UITableViewDataSource {
  public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(menuCellReuseID)
    if cell == nil {
      cell = UITableViewCell(style: .Default, reuseIdentifier: menuCellReuseID)
    }
    cell?.textLabel!.text = String(indexPath.row)
    return cell!
  }
}

extension HTPopoverMenu : UITableViewDelegate {
  public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }

  public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}

// helper methods
extension HTPopoverMenu {
  func updatePopoverPositionFromView(view: UIView) {
    let viewOriginInWorldCoordinate = view.convertPoint(CGPointZero, toView: window)
    let haveEnoughSpaceAtBottom = (viewOriginInWorldCoordinate.y + view.bounds.size.height + popoverContainerView.bounds.size.height) <= window.bounds.size.height
    if haveEnoughSpaceAtBottom {
      popoverContainerView.frame.origin.y = viewOriginInWorldCoordinate.y + view.bounds.size.height
    } else {
      popoverContainerView.frame.origin.y = viewOriginInWorldCoordinate.y - popoverContainerView.bounds.size.height
    }
  }
}