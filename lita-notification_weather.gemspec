Gem::Specification.new do |spec|
  spec.name          = "lita-notification_weather"
  spec.version       = "0.1.0"
  spec.authors       = ["kodaitakahashi"]
  spec.email         = ["kodaitakahashi.kt@gmail.com"]
  spec.description   = "Notifcation of Daito Weather"
  spec.summary       = "Slack suppoly. lita"
  spec.homepage      = "https://github.com/kodaitakahashi/lita-notification_weather"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "json"
end
