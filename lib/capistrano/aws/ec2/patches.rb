# frozen_string_literal: true

require 'aws-sdk-ec2'

module Capistrano
  class Configuration

    def ec2_instances
      ec2_resource.instances
    end

    private

    def ec2_resource
      @ec2_resource ||= ::Aws::EC2::Resource.new(region: aws_region, credentials: aws_credentials)
    end

    def aws_region
      fetch(:aws_region, ENV['AWS_REGION'])
    end

    def aws_credentials
      @aws_credentials ||= ::Aws::Credentials.new(aws_access_key_id, aws_secret_access_key, aws_session_token)
    end

    def aws_access_key_id
      fetch(:aws_access_key_id, ENV["#{stage.upcase}_ACCESS_KEY_ID"])
    end

    def aws_secret_access_key
      fetch(:aws_secret_access_key, ENV["#{stage.upcase}_SECRET_ACCESS_KEY"])
    end

    def aws_session_token
      fetch(:aws_session_token, ENV["#{stage.upcase}_SESSION_TOKEN"])
    end

    def stage
      fetch(:stage)
    end
  end

  module DSL
    module Env
      def_delegators :env, :ec2_instances
    end
  end
end
