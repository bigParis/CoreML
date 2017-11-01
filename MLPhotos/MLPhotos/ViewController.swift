//
//  ViewController.swift
//  MLPhotos
//
//  Created by 王飞 on 2017/10/20.
//  Copyright © 2017年 王飞. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //small_eco_water_bottle.jpg
        let path = Bundle.main.path(forResource: "timg2", ofType: ".jpeg")
        let imageUrl = NSURL.fileURL(withPath: path!)
        let model = try! VNCoreMLModel(for: Resnet50().model)
        let handler = VNImageRequestHandler(url: imageUrl)
        let request = VNCoreMLRequest(model: model) { (req, err) in
            guard let results = req.results as? [VNClassificationObservation] else {
                fatalError("拿不到结果")
            }
            
            var bestPrediction = ""
            var bestConfidence: VNConfidence = 0
            
            for result in results {
                if result.confidence > bestConfidence {
                    bestConfidence = result.confidence
                    bestPrediction = result.identifier
                    
                }
                print("bestPrediction:\(result.confidence), bestConfidence:\(result.identifier)")
            }
            
            print("bestPrediction:\(bestPrediction), bestConfidence:\(bestConfidence)")
        }
        try! handler.perform([request])
    }


}

