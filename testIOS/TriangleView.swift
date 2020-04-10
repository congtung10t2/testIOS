//
//  TriangleView.swift
//  testIOS
//
//  Created by tùng hoàng on 4/6/20.
//  Copyright © 2020 tung hoang. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TriangleView : UIView {
  var _color: UIColor! = UIColor.blue
  
  @IBInspectable var fillColor: UIColor? {
    get { return _color }
    set{ _color = newValue }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }
    context.beginPath()
    context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
    context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
    context.closePath()
    context.setFillColor(_color.cgColor)
    context.fillPath()
    let image = UIImage(cgImage: context.makeImage()!)
    UIGraphicsEndImageContext();
    let imageCI = image.blurCI(radius: AppConfig.radius)
    context.clear(rect)
    imageCI.draw(in: rect)
  }
}
