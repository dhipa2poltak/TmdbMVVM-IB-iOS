# Uncomment the next line to define a global platform for your project
platform :ios, '14.3'

use_frameworks!

workspace 'TmdbMVVM-IB'

inhibit_all_warnings!

target 'domain' do
   # Provide path for module project file
   project './domain/domain.project'

  pod 'RxSwift',    '~> 6.0.0'
end

target 'data' do
   # Provide path for module project file
   project './data/data.project'

  pod 'RxSwift',    '~> 6.0.0'
end

target 'app_framework' do
  project './app_framework/app_framework.project'

  pod 'Alamofire', '~> 5.4.0'
  pod 'Kingfisher', '~> 4.10.1'

  pod 'SwifterSwift', '~> 5.2.0'
  pod 'SwiftyJSON', '~> 5.0.0'

  pod 'RxSwift',    '~> 6.0.0'
end

target 'feature_genre' do
  project './features/feature_genre/feature_genre.project'

  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'RxSwift',    '~> 6.0.0'
end

target 'feature_movie_by_genre' do
  project './features/feature_movie_by_genre/feature_movie_by_genre.project'

  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'RxSwift',    '~> 6.0.0'
end

target 'TmdbMVVM-IB' do
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for TmdbMVVM-IB
  pod 'Alamofire', '~> 5.4.0'
  pod 'Kingfisher', '~> 4.10.1'
  pod 'Wormholy', '~> 1.6.4', configurations: ['Debug Staging', 'Debug Verify', 'Debug Production']
  pod 'AlamofireNetworkActivityLogger', '~> 3.4', configurations: ['Debug Staging', 'Debug Verify', 'Debug Production']

  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'EZAlertController', :git => 'https://github.com/thellimist/EZAlertController.git'

  pod 'SwifterSwift', '~> 5.2.0'
  pod 'SwiftyJSON', '~> 5.0.0'

  pod 'YouTubePlayer'

  pod 'RxSwift',    '~> 6.0.0'
  pod 'RxCocoa',    '~> 6.0.0'

  pod 'Swinject', '2.8.3'

end

target 'TmdbMVVM-IBTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'TmdbMVVM-IBUITests' do
  # Pods for testing
end
