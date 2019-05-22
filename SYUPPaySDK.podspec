#
# Be sure to run `pod lib lint SYUPPaySDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SYUPPaySDK'
  s.version          = '2.0.0'
  s.summary          = '集成银联支付SDK(v3.3.12), 银联苹果支付SDK(v4.2.2)，支持打包成动态库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    在银联支付官方SDK上包了一层，支持打包成动态库
                       DESC

  s.homepage         = 'https://github.com/isandboy/SYUPPaySDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'isandboy' => 'sandboylu@gmail.com' }
  s.source           = { :git => 'https://github.com/isandboy/SYUPPaySDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'SYUPPaySDK/*.{h,m}'

  #s.default_subspecs = 'PayWallet'

  # 银联支付
  s.subspec 'PayWallet' do |ss|
    ss.source_files = 'SYUPPaySDK/paymentcontrol/**/*.h'
    ss.frameworks = 'CFNetwork', 'SystemConfiguration'
    ss.vendored_libraries = 'SYUPPaySDK/paymentcontrol/**/*.a'
    ss.libraries = 'z', 'c++'
    ss.frameworks = 'CFNetwork', 'SystemConfiguration'
  end

  # 银联苹果支付
  s.subspec 'ApplyPay' do |ss|
    ss.source_files = 'SYUPPaySDK/applePaySDK/**/*.h'
    ss.frameworks = 'CFNetwork', 'SystemConfiguration'
    ss.vendored_libraries = 'SYUPPaySDK/applePaySDK/**/*.a'
    ss.libraries = 'z', 'c++'
    ss.frameworks = 'CFNetwork', 'SystemConfiguration', 'PassKit'
  end

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-all_load' }

end
