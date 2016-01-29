#
# Be sure to run `pod lib lint NLabel.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NHLabel"
  s.version          = "0.5.0"
  s.summary          = "Simple label with actions"
  s.description      = <<-DESC
                       Custom UILabel with some build in menu actions
                        like call, send sms, send email and go to url.
                       DESC
  s.homepage         = "https://github.com/naithar/NHLabel"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Naithar" => "devias.naith@gmail.com" }
  s.source           = { :git => "https://github.com/naithar/NHLabel.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resources = ['Pod/Localization/**']

  s.public_header_files = 'Pod/Classes/NHLabel.h'
end
