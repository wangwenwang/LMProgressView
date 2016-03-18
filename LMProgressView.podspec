Pod::Spec.new do |spec|
  spec.name         = 'LMProgressView'
  spec.version      = '1.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/wangwenwang/LMProgressView'
  spec.authors      = { '王文望' => '372266373@qq.com' }
  spec.summary      = 'ARC and GCD Compatible Reachability Class for iOS and OS X.'
  spec.source       = { :git => 'https://github.com/wangwenwang/LMProgressView.git', :tag => '1.0.1' }
  spec.source_files = 'Third/LMProgressView.{h,m}'
  spec.framework    = 'Foundation', 'UIKit'
end
