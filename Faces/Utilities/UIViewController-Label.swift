//
//  UIViewController-Label.swift
//  Faces
//
//  Created by Juan-Carlos Foust on 12/3/17.
//  Copyright © 2017 Vadym Markov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func append(to label: UILabel, title: String, text: String) {
        DispatchQueue.main.async { [weak label] in
            let attributedText = label?.attributedText ?? NSAttributedString(string: "")
            let string = NSMutableAttributedString(attributedString: attributedText)
            string.append(.init(string: "\(title): ", attributes: [.font: UIFont.boldSystemFont(ofSize: 18)]))
            string.append(.init(string: text, attributes: [.font: UIFont.systemFont(ofSize: 18)]))
            string.append(.init(string: "\n\n"))
            label?.attributedText = string
        }
    }
}
