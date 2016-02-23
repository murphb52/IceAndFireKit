#
# Be sure to run `pod lib lint IceAndFireKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IceAndFireKit"
  s.version          = "0.1.0"
  s.summary          = "Simple library for easy access to AnApiOfIceAndFire."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
A Simple Swift implementation of interaction with the Api AnApiOfIceAndFire.
RequestEngine and Models to get information from the API (https://anapioficeandfire.com) in an easily accesible way
                       DESC

  s.homepage         = "https://github.com/murphb52/IceAndFireKit"
  # s.screenshots     = "", ""
  s.license          = 'MIT'
  s.author           = { "Brian Murphy" => "brianmartinmurphy@gmail.com" }
  s.source           = { :git => "https://github.com/murphb52/IceAndFireKit.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'IceAndFireKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
