# multipart-Image-Upload-ios-demo

### Now You can Use this class using below pods

```
pod 'multipart-Image-Upload-ios-demo'
```
- If you use above Parameters and URL this is the demo/ Debug URL for library. so in init mwthod i have passed the debug as true.
- In you URL and parameter you need to pass debug As a false.
- You can upload only three type of image like JPEG, PNG and GIF



```
//*************************      Testing code       ************************************
let url = "https://api.imgur.com/3/image"
let parameters = ["name": "MyTest",
                 "description": "My tutorial test"]
//***************************************************************************************

let objmultipart = VMultipartImage.init(url, paramters: parameters, image: #imageLiteral(resourceName: "testImage"), imagekey: "image", imageName: "abc.jpeg",MimeType: .jpeg,Debug: true)
        
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
```
