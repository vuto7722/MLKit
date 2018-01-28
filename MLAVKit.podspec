
Pod::Spec.new do |s|
  s.name         = "MLAVKit"
  s.version      = "1.0.1"
  s.summary      = "Collection for usage tools to make development Swift faster"
  s.description  = "Collection for usage tools to make development Swift faster"
  s.homepage     = "http://mobytelab.com/"
  s.license      = "MIT"
  s.author             = { "To Anh Vu" => "vu.to@mobytelab.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/vuto7722/MLKit.git", :tag => "#{s.version}" }
  s.source_files  = "MLKit", "MLKit/**/*.{h,m,swift}"
  s.exclude_files = "MLKit/Examples", "MLKit/MLKitTests"
s.framework = "UIKit"
s.dependency 'IQKeyboardManagerSwift'
s.dependency 'RxSwift',    '~> 4.0'
s.dependency 'RxCocoa',    '~> 4.0'
s.dependency 'Alamofire', '~> 4.5'
s.dependency 'LoadableViews', '~> 2.2.0'
s.dependency 'RxAlamofire'
s.dependency 'RxDataSources', '~> 3.0'
s.dependency 'Kingfisher', '~> 4.0'
end
