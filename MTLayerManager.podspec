Pod::Spec.new do |s|
  s.name         = "MTLayerManager"
  s.version      = "1.0.0"
  s.summary      = "Mittap kuso screenview"

  s.description  = <<-DESC
                   Mittap kuso screenview
                   DESC

  s.homepage     = "https://github.com/iMittap/MTLayerManager"
  s.license      = "MIT"
  s.author       = { "ericericx" => "ericericx@gmail.com" }
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "git@github.com:iMittap/MTLayerManager.git", :tag => s.version }
  s.source_files  = "Source"
  s.public_header_files = "Source/*.h" 
end
