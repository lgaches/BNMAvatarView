Pod::Spec.new do |s|
  s.name         = "BNMAvatarView"
  s.version      = "0.0.1"
  s.summary      = "BNMAvatarView "
  s.homepage     = "https://github.com/lgaches/BNMAvatarView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Laurent Gaches" => "laurent@binimo.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/lgaches/BNMAvatarView.git", :tag => "0.0.1" }
  s.source_files  = 'Classes/**/*.{h,m}'
  s.framework  = 'QuartzCore'
end
