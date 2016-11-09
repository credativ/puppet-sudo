require 'spec_helper'

describe 'sudo' do
  context 'with default parameter' do
    it do
      is_expected.to compile
    end
  end
end
