//
//  NvpResourcesLoader.swift
//
//  Created by shogo on 2020/05/29.
//

import Foundation
import UIKit

struct NvpResoucesLoader {
    private var bundle: Bundle?
    init() {
        let path = Bundle.main.path(forResource: "NvpResources", ofType: "bundle")!
        bundle = Bundle.init(path: path)
    }
    // bundle から取得する
    func getImage(named: String) -> UIImage? {
        guard let contentPath = bundle?.path(forResource: "\(named)@3x.png", ofType: nil) else {return nil}
        return UIImage.init(contentsOfFile: contentPath)
    }
}
