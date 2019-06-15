
Pod::Spec.new do |s|
  s.name             = 'StoriesLayout'
  s.version          = '0.1.1'
  s.summary          = 'An Instagram Stories like UICollectionViewLayout'
  s.swift_version    = '5.0'
  s.description      = <<-DESC
This is a UICollectionViewLayout that reproduce the Instagram Stories experience,
just use StoriesCollectionViewLayout in your UICollectionView and subclass your cells from StoriesCollectionViewCell!
                       DESC

  s.homepage         = 'https://github.com/Oni-zerone/CollectionLayouts'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrea Altea' => 'oni.zerone@gmail.com' }
  s.source           = { :git => 'https://github.com/Oni-zerone/CollectionLayouts.git', :tag => 'StoriesLayout-' + s.version.to_s }
  s.social_media_url = 'https://twitter.com/Oni_zerone'

  s.ios.deployment_target = '10.0'

  s.source_files = 'StoriesLayout/Classes/**/*'
  s.frameworks = 'UIKit', 'CoreGraphics'
end
