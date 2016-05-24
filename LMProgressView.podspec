Pod::Spec.new do |s|
  s.name         = 'LMProgressView'
  s.version      = '1.0.3'
  s.license      = 'MIT' 
  s.summary      = 'This is a progress bar prompts, let the user know the background doing'
  s.homepage     = 'https://github.com/wangwenwang/LMProgressView'
  s.authors      = { 'wangwenwang' => '372266373@qq.com' }
  s.source       = { :git => 'https://github.com/wangwenwang/LMProgressView.git', :tag => '1.0.3' }
  s.requires_arc = true
  s.platform     = :ios 
  s.source_files = 'Third/LMProgressView.{h,m}'
  s.framework    = 'Foundation', 'UIKit'
end
