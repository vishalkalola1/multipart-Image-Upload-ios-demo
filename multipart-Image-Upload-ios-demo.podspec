Pod::Spec.new do |s|
s.name             = 'MultipartImageUploadSwift4.0'
s.version          = '1.0'
s.summary          = 'Upload image using Multipart in swift'
s.description      = <<-DESC
Upload any kind of image using multipart in swift
DESC
s.homepage         = 'https://github.com/vishalkalola1/multipart-Image-Upload-ios-demo.git'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'vishal patel' => 'vishalkalola196@gmail.com' }
s.source           = { :git => 'https://github.com/vishalkalola1/multipart-Image-Upload-ios-demo.git', :branch => "master", :tag => "1.0"}
s.platform     = :ios
s.ios.deployment_target = "8.0"
s.source_files	   = "MultipartImageUpload/MultipartImageUpload/VMultipartImage.swift"
s.requires_arc = true
end
