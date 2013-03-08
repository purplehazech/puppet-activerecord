require 'rubygems'
require 'rspec-hiera-puppet'
require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.filter_run_excluding :broken => true
end

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

shared_context "hieradata" do
  let(:hiera_config) do
    { :backends => ['rspec', 'yaml'],
      :hierarchy => [
        '%{calling_module}'],
      :yaml => {
        :datadir => File.join(fixture_path, 'hieradata') },
      :rspec => respond_to?(:hiera_data) ? hiera_data : {} }
  end
end

