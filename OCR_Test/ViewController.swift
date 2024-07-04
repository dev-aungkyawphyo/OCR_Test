//
//  ViewController.swift
//  OCR_Test
//
//  Created by Aung Kyaw Phyo on 05/07/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // URL
        let url = URL(string: "https://ocr-text-extractor.p.rapidapi.com/detect-text-from-image-uri")
        
        guard url != nil else {
            print("Error creating url object")
        }
        
        // URL Request
        var request = URLRequest(url: url!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        
        // Specify the header
        let headers = [
            "x-rapidapi-key": "a3b48041a9mshd5cb437aea769a7p103232jsn038154a7de79",
            "x-rapidapi-host": "ocr-text-extractor.p.rapidapi.com",
            "Content-Type": "application/json",
            "Accept": "string"
        ]
        
        request.allHTTPHeaderFields = headers
        
        // Specify the body
        let jsonObject = [
            "Uri": "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
            "Language": "eng",
            "DetectOrientation": false,
            "Scale": false,
            "IsTable": false,
            "OcrEngine": "Version2"
        ] as [String : Any]
        
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
            request.httpBody = requestBody
        } catch {
            print("Error creating the data object from json")
        }
        
        // Set the request type
        request.httpMethod = "POST"
        
        // Get the URLSession
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: request) { data, response, error in
            // Check for errors
            if error == nil && data != nil {
                // Try to parse out the data
                
            }
        }
        
        // Fire off the data task
    }


}

