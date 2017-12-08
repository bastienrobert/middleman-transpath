# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-transpath"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bastien Robert"]
  # s.email       = ["email@example.com"]
  # s.homepage    = "http://example.com"
  s.summary     = "i18n helper for slug and current page translating"
  s.description = "This helper allows you to translate your current path to the same path in another locale, with a different slug. It can be include in a partial, in the header for example ; and need a simple 2 minutes configuration."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.2.1"])

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
