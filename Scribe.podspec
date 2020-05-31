Pod::Spec.new do |s|
  s.name             = 'Scribe'
  s.version          = '0.1.0'
  s.summary          = 'Scribe is a framework to share localization files'

  s.description      = <<-DESC
Framework used to share localization to a project
                       DESC

  s.homepage         = 'https://github.com/Xodia/Scribe'
  s.author           = { 'Morgan Collino' => 'morgan.collino@gmail.com' }
  s.source           = { :git => 'https://github.com/Xodia/Scribe.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/morgancollino'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'Output/iOS/**/*{swift}'
  s.resources = 'Output/iOS/**/*.{xib,storyboard,png,jpg,pdf,xcassets,imageset,lproj,strings,stringsdict}'
end
