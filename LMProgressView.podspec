Pod::Spec.new do |s|
  s.name         = 'LMProgressView'
  s.version      = '1.0.2'
  s.license      = "MIT"  //开源协议
  s.homepage     = 'https://github.com/wangwenwang/LMProgressView'
  s.authors      = { '王文望' => '372266373@qq.com' }
  s.summary      = 'This is a progress bar prompts, let the user know the background doing'
  s.source       = { :git => 'https://github.com/wangwenwang/LMProgressView.git', :tag => '1.0.1' }
  s.platform     = :ios 
  s.source_files = 'Third/LMProgressView.{h,m}'
  s.framework    = 'Foundation', 'UIKit'
  s.requires_arc = true
end
