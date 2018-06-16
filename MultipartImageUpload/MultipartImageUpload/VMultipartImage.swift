//
//  VMultipartImage.swift
//  MultipartImageUpload
//
//  Created by Moweb on 06/06/18.
//  Copyright © 2018 vishal. All rights reserved.
//

import UIKit

enum Method : String { //--- add Mehtod depends on your requirement
    case GET = "GET"
    case POST = "POST"
    
}

enum MimeType:String { //--- add MimeType depends on your requirement
    case jpeg = "image/jpeg"
    case png = "image/png"
    case gif = "image/gif"
    
}

typealias Parameters = [String: String]

class VMultipartImage: NSObject {
    
    var request : URLRequest!
    
    init(_ postUrl:String,paramters:Parameters, image:UIImage, imagekey:String, imageName:String) {
        super.init()
        guard let mediaImage = MediaData(image, key: imagekey, imageName: imageName) else { return }
        guard let url = URL(string: postUrl) else { return }
        request = URLRequest(url: url)
        request.httpMethod = Method.POST.rawValue
        let boundary = generateBoundary()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.addValue("Client-ID f65203f7020dddc", forHTTPHeaderField: "Authorization") // ---- Testing code
        let dataBody = createDataBody(withParameters: paramters, media: [mediaImage], boundary: boundary)
        request?.httpBody = dataBody
    }
    
    func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    func createDataBody(withParameters params: Parameters?, media: [MediaData]?, boundary: String) -> Data {
        
        let lineBreak = "\r\n"
        var body = Data()
        
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }
        
        if let media = media {
            for photo in media {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(photo.key ?? "DefaultValue")\"; filename=\"\(photo.filename ?? "DefaultValue.jpeg")\"\(lineBreak)")
                body.append("Content-Type: \(photo.mimeType! + lineBreak + lineBreak)")
                body.append(photo.data!)
                body.append(lineBreak)
            }
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
}

struct MediaData {
    let key: String?
    let filename: String?
    let data: Data?
    let mimeType: String?
    
    init?(_ image: UIImage, key: String, imageName: String) {
        self.key = key
        self.mimeType = MimeType.jpeg.rawValue
        self.filename = imageName
        guard let data = UIImageJPEGRepresentation(image, 0.7) else { return nil }
        self.data = data
    }
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
