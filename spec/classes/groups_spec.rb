require 'spec_helper'

describe 'sudo::groups' do
  context 'with minimal parameter' do
    let(:params) { {
      :ensure => true,
    } }
    it do
      is_expected.to compile
    end
  end
end
