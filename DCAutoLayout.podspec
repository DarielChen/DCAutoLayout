Pod::Spec.new do |s|

s.name         = "DCAutoLayout"
s.version      = "1.0.2"
s.summary      = "A Swift Autolayout DSL for iOS"
s.homepage     = "https://github.com/DarielChen/DCAutoLayout"
s.license      = "MIT"
s.author       = { "DarielChen" => "chendariel@gmail.com" }
s.social_media_url = 'https://twitter.com/DarielCQ'
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/DarielChen/DCAutoLayout.git", :tag => "#{s.version}" }
s.source_files = "DCAutoLayout/DCAutoLayout/*.swift"
s.swift_version = '4.2'

end  