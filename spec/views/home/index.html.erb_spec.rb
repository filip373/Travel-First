# frozen_string_literal: true
require 'rails_helper'

describe 'home/index.html.erb', type: :view do
  before do
    render
  end

  it 'has Travel First title' do
    expect(rendered).to have_css('h1.title', text: 'Travel First')
  end

  it 'has explore button' do
    expect(rendered).to have_button('Explore now')
  end
end
