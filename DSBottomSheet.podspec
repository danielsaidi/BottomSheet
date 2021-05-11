# Run `pod lib lint' to ensure this is a valid spec.

Pod::Spec.new do |s|
  s.name             = 'DSBottomSheet'
  s.version          = '0.1.0'
  s.swift_versions   = ['5.3']
  s.summary          = 'DSBottomSheet makes it easy to add custom bottom sheets to your SwiftUI apps.'

  s.description      = <<-DESC
  BottomSheet is a SwiftUI library with tools for creating custom bottom sheet and adding them to your iOS apps.
                       DESC

  s.homepage         = 'https://github.com/danielsaidi'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Saidi' => 'daniel.saidi@gmail.com' }
  s.source           = { :git => 'https://github.com/danielsaidi/BottomSheet.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/danielsaidi'

  s.swift_version = '5.3'
  s.ios.deployment_target = '13.0'
  
  s.source_files = 'Sources/**/*.swift'
  s.resources = "Sources/BottomSheet/Resources/*.xcassets"
end
