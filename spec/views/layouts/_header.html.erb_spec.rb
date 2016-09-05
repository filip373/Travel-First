# frozen_string_literal: true
require 'rails_helper'

describe 'layouts/_header.html.erb', type: :view do
  before do
    render
  end

  it 'has Travel First logo' do
    expect(rendered).to have_css('img.brand-logo')
  end

  it 'has Explore link' do
    expect(rendered).to have_link('Explore')
  end

  it 'has Map link' do
    expect(rendered).to have_link('Map')
  end

  it 'has Log in button' do
    expect(rendered).to have_button('Log in')
  end

  it 'has Sign up button' do
    expect(rendered).to have_button('Sign up')
  end
end
