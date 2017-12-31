import VisionLab

final class ViewController: ImageClassificationController<ClassificationService> {
  override func viewDidLoad() {
    super.viewDidLoad()
    classificationService.delegate = self
  }
}

// MARK: - ClassificationServiceDelegate

extension ViewController: ClassificationServiceDelegate {
  func classificationService(_ service: ClassificationService, didDetectGender gender: String) {
    append(to: mainView.label, title: "Gender", text: gender)
  }

  func classificationService(_ service: ClassificationService, didDetectAge age: String) {
    append(to: mainView.label, title: "Age", text: age)
  }

  func classificationService(_ service: ClassificationService, didDetectEmotion emotion: String) {
    append(to: mainView.label, title: "Emotions", text: emotion)
  }
}
