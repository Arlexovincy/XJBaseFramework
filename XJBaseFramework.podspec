#
# Be sure to run `pod lib lint XJBaseFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XJBaseFramework'
  s.version          = '0.1.0'
  s.summary          = 'iOS Swift App开发的基本框架'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AndreaArlex/XJBaseFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AndreaArlex' => 'lixijian@tuandai.com' }
  s.source           = { :git => 'https://github.com/AndreaArlex/XJBaseFramework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

#  s.source_files = 'XJBaseFramework/Classes/**/*'
  
  s.subspec 'XJUIKit' do |uikit|
    uikit.source_files = 'XJBaseFramework/Classes/XJUIKit/**'
    uikit.dependency 'UIColor_Hex_Swift', '~> 5.1.7'
    uikit.dependency 'MBProgressHUD', '~> 1.2.0'
  end
  
  s.subspec 'XJLoger' do |xiloger|
    xiloger.source_files = 'XJBaseFramework/Classes/XJLoger/**'
    xiloger.dependency 'CocoaLumberjack/Swift'
  end
  
  # s.resource_bundles = {
  #   'XJBaseFramework' => ['XJBaseFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
