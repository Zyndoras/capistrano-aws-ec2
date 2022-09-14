# frozen_string_literal: true

require 'capistrano'
require 'capistrano/aws/ec2/version'
require 'capistrano/aws/ec2/patches'

module Capistrano
  module Aws
    module Ec2
      class Error < StandardError; end
    end
  end
end
