//
//  UINib+Extensions.swift
//  Pods
//
//  Created by Hoang Tran on 8/25/16.
//
//

import UIKit

extension UINib {
  class func fromPodWithNibName(nibName: String) -> UINib? {
    let podBundle = NSBundle(forClass: HTPopoverMenu.classForCoder())
    guard
      let bundleURL = podBundle.URLForResource("HTPopoverMenu", withExtension: "bundle"),
      let bundle = NSBundle(URL: bundleURL)
      else { return nil }
    return UINib(nibName: nibName, bundle: bundle)
  }
}
