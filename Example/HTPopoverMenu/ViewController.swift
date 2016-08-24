//
//  ViewController.swift
//  HTPopoverMenu
//
//  Created by Hoang Tran on 08/24/2016.
//  Copyright (c) 2016 Hoang Tran. All rights reserved.
//

import UIKit
import HTPopoverMenu

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  let menu = HTPopoverMenu()

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCustomCells()
  }

}

extension ViewController {

  func registerCustomCells() {
    tableView.registerNib(UINib(nibName: "DemoCell", bundle: nil), forCellReuseIdentifier: kDemoCellReuseID)
  }

}

extension ViewController : UITableViewDataSource {

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(kDemoCellReuseID, forIndexPath: indexPath) as! DemoCell
    cell.delegate = self
    return cell
  }

}

extension ViewController : UITableViewDelegate {

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 120
  }

}

extension ViewController : DemoCellDelegate {

  func demoCell(demoCell: DemoCell, onTapButton button: UIButton) {
    menu.showFromView(button)
  }

}