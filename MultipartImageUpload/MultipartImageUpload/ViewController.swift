//
//  ViewController.swift
//  MultipartImageUpload
//
//  Created by Moweb on 06/06/18.
//  Copyright © 2018 vishal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //*************** Testing code ***************
         
         let url = "https://api.imgur.com/3/image"
         let parameters = ["name": "MyTestFile123321",
         "description": "My tutorial test file for MPFD uploads"]
        
        let objmultipart = VMultipartImage.init(url, paramters: parameters, image: #imageLiteral(resourceName: "testImage"), imagekey: "image", imageName: "abc.jpeg")
        
        let session = URLSession.shared
        session.dataTask(with: objmultipart.request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

