//
//  UIImage+Extension.swift
//  testIOS
//
//  Created by tùng hoàng on 4/6/20.
//  Copyright © 2020 tung hoang. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
  func blurCI(radius: Int) -> UIImage {
    let filter = CIFilter(name: AppConfig.effectName)
    let ciInput = CIImage(image: self)
    filter?.setValue(ciInput, forKey: kCIInputImageKey)
    filter?.setValue((radius), forKey: kCIInputRadiusKey)
    let ciOutput = filter?.outputImage
    let ciContext = CIContext()
    let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)

    return UIImage(cgImage: cgImage!)

  }

}
