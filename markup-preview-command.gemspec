# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "markup-preview-command/version"

Gem::Specification.new do |s|

  s.name        = "markup-preview-command"
  s.version     = Markup::Preview::Command::VERSION
  s.authors     = ["mori_dev"]
  s.email       = ["mori.dev.asdf@gmail.com"]
  s.homepage    = "https://github.com/mori-dev/markup-preview-command"
  s.summary     = %q{Previw your wiki file as local html file.}
  s.description = %q{Previw your wiki file as local html file. (format: markdown, rest, textile, rdoc and so on.)}

  s.rubyforge_project = "markup-preview-command"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('github-markup', '~> 0.7.0')
  s.add_dependency('creole', '~>0.3.6')
  s.add_dependency('redcarpet', '2.0.0')
  s.add_dependency('RedCloth', '~>4.2.0')
  s.add_dependency('rdoc', '~>3.6.0')
  s.add_dependency('org-ruby', '~>0.5.0')
  s.add_dependency('wikicloth', '~>0.7.0')
  s.add_dependency('rake', '~>0.9.0')
  s.add_dependency('slop', '~>2.4.0')
  s.add_development_dependency("rspec", "~> 2.11.0")

end
