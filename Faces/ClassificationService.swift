import CoreML
import Vision
import VisionLab

/// Service used to perform gender, age and emotion classification
final class ClassificationService: ClassificationServiceProtocol {
  
  /// The service's delegate
  weak var delegate: ClassificationServiceDelegate?

  /// Array of models
  private var models = [VNRequest]()

  /// Create CoreML model and classification requests
  func setup() {
    do {
      // Gender request
      models.append(VNCoreMLRequest(
        model: try VNCoreMLModel(for: GenderNet().model),
        completionHandler: handleGenderClassification
      ))
      // Age request
      models.append(VNCoreMLRequest(
        model: try VNCoreMLModel(for: AgeNet().model),
        completionHandler: handleAgeClassification
      ))
      // Emotions request
      models.append(VNCoreMLRequest(
        model: try VNCoreMLModel(for: CNNEmotions().model),
        completionHandler: handleEmotionClassification
      ))
    } catch {
      assertionFailure("Can't load Vision ML model: \(error)")
    }
  }

  /// Run individual requests one by one.
  func classify(image: CIImage) {
    for model in self.models {
        let request = VNImageRequestHandler(ciImage: image)
        _ = try? request.perform([model])
    }
  }

  // MARK: - Handling

  @objc private func handleGenderClassification(request: VNRequest, error: Error?) {
    let result = extractClassificationResult(from: request, count: 1)
    delegate?.classificationService(self, didDetectGender: result)
  }

  @objc private func handleAgeClassification(request: VNRequest, error: Error?) {
    let result = extractClassificationResult(from: request, count: 1)
    delegate?.classificationService(self, didDetectAge: result)
  }

  @objc private func handleEmotionClassification(request: VNRequest, error: Error?) {
    let result = extractClassificationResult(from: request, count: 1)
    delegate?.classificationService(self, didDetectEmotion: result)
  }
}
