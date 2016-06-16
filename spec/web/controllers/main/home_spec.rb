require 'spec_helper'
require_relative '../../../../apps/web/controllers/main/home'

describe Web::Controllers::Main::Home do
  let(:action) { Web::Controllers::Main::Home.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
