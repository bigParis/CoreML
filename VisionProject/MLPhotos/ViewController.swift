import UIKit
import CoreML
import Vision
import ImageIO

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet weak var buttonOriginalImage: UIButton!
    @IBOutlet var buttonTargetImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func pressedChoosePhoto(_ sender: Any) {
        self.chooseImage()
    }
    
    func processImage(image: UIImage) {
        
        self.resultLabel.text = "相片处理中。。。"
        
        let handler = VNImageRequestHandler(cgImage: image.cgImage!)
        
        do {
            let request = VNDetectFaceRectanglesRequest(completionHandler: handleFaceFetection)
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    func handleFaceFetection(request: VNRequest, error: Error?){
        // VNObservation 观察所得
        guard let observations = request.results as? [VNFaceObservation] else {
            fatalError("NO FACE!!!")
        }
        
        self.resultLabel.text = "找到\(observations.count) 张脸"
        
    }

}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let uiImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("no image selected")
        }
        self.buttonOriginalImage.setBackgroundImage(uiImage, for: .normal)
        self.processImage(image: uiImage)
    }
}











