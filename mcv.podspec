Pod::Spec.new do |spec|
  spec.name         = "mcv"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of mcv."
  spec.description  = <<-DESC
  Insert Description
  DESC

  # spec.homepage     = "http://EXAMPLE/mcv"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  
  spec.license      = "MIT (example)"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Zonily Jame Pesquera" => "zonilyjame@gmail.com" }
  spec.social_media_url   = "https://twitter.com/kuyazee"
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/kuyazee/mcv.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/mcv/**/*.{swift}"

  spec.requires_arc = true

end
