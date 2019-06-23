# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PhotoMemories' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    
    use_frameworks!
    inhibit_all_warnings!
    
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'SwiftyJSON'
    pod 'SwiftLint'
    pod 'Kingfisher'
    pod 'Google-Mobile-Ads-SDK'
    pod 'NVActivityIndicatorView'
    pod 'GoogleAPIClientForREST/Drive', '~> 1.2.1'
    pod 'ESTabBarController-swift'
    pod 'MXSegmentedPager'
    pod 'GoogleSignIn'
    pod 'PinterestLayout'
    pod 'RxAlamofire'
    pod 'ALCameraViewController'
    
    post_install do |installer|
        installer.pods_project.targets.each do |target|
            if ['PinterestLayout'].include? target.name
                target.build_configurations.each do |config|
                    config.build_settings['SWIFT_VERSION'] = '3.3'
                end
            end
        end
    end
    
end
