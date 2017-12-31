//
//  ClassificationServiceProtocol.swift
//  Faces
//
//  Created by Juan-Carlos Foust on 12/3/17.
//  Copyright © 2017 Vadym Markov. All rights reserved.
//

import Foundation

/// Delegate protocol used for `ClassificationService`
protocol ClassificationServiceDelegate: class {
    func classificationService(_ service: ClassificationService, didDetectGender gender: String)
    func classificationService(_ service: ClassificationService, didDetectAge age: String)
    func classificationService(_ service: ClassificationService, didDetectEmotion emotion: String)
}
