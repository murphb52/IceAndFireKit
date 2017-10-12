#
# Be sure to run `pod lib lint IceAndFireKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IceAndFireKit"
  s.version          = "1.2"
  s.summary          = "Simple library for easy access to AnApiOfIceAndFire."


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

end
