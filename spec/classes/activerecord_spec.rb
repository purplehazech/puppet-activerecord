require 'spec_helper'

describe 'activerecord' do

  context "when called with no params" do
    it "will behave ok" do
      should contain_class('activerecord')
      should_not contain_notify('activerecord is present')
      should_not contain_notify('activerecord is absent')
    end
  end

  context "param ensure set to absent" do
    let :params do
      { :enable => 'absent' }
    end

    it "will not fail but emit a message" do
      should contain_class('activerecord')
      should contain_notify('activerecord is absent')
      # add more checks for disabling the module here!
    end
  end
  
  context "will install the activerecord package" do
    it "call package" do
      should contain_package('activerecord')
    end
  end

  context "param absent set from hiera", :broken => true do
    # @todo check back to see if hiera test are fixed later
    include_context "hieradata"

    let :hiera_data do
      { :enable => 'absent' }
    end

    it "will emit a message" do
      should contain_notify('activerecord is absent')
    end
  end

end
