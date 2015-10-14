Gem::Specification.new do |s|
  s.name        = 'popflash_match_downloader'
  s.version     = '0.0.1'
  s.license     = 'MIT'

  s.summary     = 'A tool to download match demos from popflash.site'

  s.authors     = ['Lukas Stabe']
  s.email       = 'lukas@stabe.de'
  s.homepage    = 'https://github.com/Ahti/popflash_match_downloader'
  s.files       = `git ls-files README.md LICENSE lib bin`.split "\n"
  s.executables = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }

  s.add_runtime_dependency 'thor', '~> 0.19', '>= 0.19.1'
end
