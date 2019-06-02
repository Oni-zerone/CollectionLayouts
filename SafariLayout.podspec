
Pod::Spec.new do |s|
    s.name             = 'SafariLayout'
    s.version          = '0.1.0'
    s.summary          = 'A Safari tabs like UICollectionViewLayout'
    s.swift_version    = '5.0'
    s.description      = <<-DESC
    This is a UICollectionViewLayout that reproduce the iOS Safari tabs experience,
    just use SafariCollectionViewLayout in your UICollectionView and subclass your cells from SafariCollectionViewCell!
    DESC
    
    s.homepage         = 'https://github.com/Oni-zerone/CollectionLayouts'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andrea Altea' => 'oni.zerone@gmail.com' }
    s.source           = { :git => 'https://github.com/Oni-zerone/CollectionLayouts.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/Oni_zerone'
    
    s.ios.deployment_target = '10.0'
    
    s.source_files = 'SafariLayout/Classes/**/*'
    s.frameworks = 'UIKit', 'CoreGraphics'
end
