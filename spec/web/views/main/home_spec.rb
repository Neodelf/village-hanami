require 'spec_helper'
require_relative '../../../../apps/web/views/main/home'

describe Web::Views::Main::Home do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/main/home.html.erb') }
  let(:view)      { Web::Views::Main::Home.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
