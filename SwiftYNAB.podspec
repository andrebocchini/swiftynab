Pod::Spec.new do |s|

  s.name  = "SwiftYNAB"
  s.version = "1.1.0"
  s.summary = "YNAB API Framework"
  s.description = "SwiftYNAB is an iOS/macOS/tvOS/WatchOS framework for the You Need a Budget API"
  s.homepage = "http://github.com/andrebocchini/swiftynab"
  s.license = "MIT"
  s.author = { "Andre Bocchini" => "andrebocchini@gmail.com" }
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.14"
  s.tvos.deployment_target = "12.2"
  s.watchos.deployment_target = "5.2"
  s.source  = { :git => "https://github.com/andrebocchini/swiftynab.git" }
  s.source_files  = "SwiftYNAB/SwiftYNAB/**/*.{swift}"

end
