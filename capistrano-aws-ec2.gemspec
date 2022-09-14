# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/capistrano/aws/ec2/version'

Gem::Specification.new do |spec|
  spec.name = 'capistrano-aws-ec2'
  spec.version = Capistrano::Aws::Ec2::VERSION
  spec.authors = ['Alex Sella']
  spec.email = ['zyndoras@gmail.com']

  spec.summary = 'Deploy to AWS EC2 via Capistrano.'
  spec.description = 'Dynamically select EC2 instances to interact with using Capistrano.'
  spec.homepage = 'https://github.com/zyndoras/capistrano-aws-ec2'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/zyndoras/capistrano-aws-ec2'
  spec.metadata['changelog_uri'] = 'https://github.com/zyndoras/capistrano-aws-ec2/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'aws-sdk-ec2', '~> 1.0'
  spec.add_dependency 'capistrano', '~> 3.0'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
end
