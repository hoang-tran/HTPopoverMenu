//
//  DemoCell.swift
//  HTPopoverMenu
//
//  Created by Hoang Tran on 8/24/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

let kDemoCellReuseID = "DemoCell"

protocol DemoCellDelegate {
  func demoCell(demoCell: DemoCell, onTapButton button: UIButton)
}

class DemoCell : UITableViewCell {

  var delegate : DemoCellDelegate?

  @IBAction func onTapButton(sender: AnyObject) {
    delegate?.demoCell(self, onTapButton: sender as! UIButton)
  }
  
}