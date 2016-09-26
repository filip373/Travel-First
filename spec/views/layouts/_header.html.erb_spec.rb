# frozen_string_literal: true
require 'rails_helper'

describe 'layouts/_header.html.erb', type: :view do
  context 'when user is not logged in' do
    before { render }

    it 'has Travel First logo' do
      expect(rendered).to have_css('img.brand-logo')
    end

    it 'has Explore link' do
      expect(rendered).to have_link('Explore')
    end

    it 'has Map link' do
      expect(rendered).to have_link('Map')
    end

    it 'has Log in link' do
      expect(rendered).to have_link('Log in')
    end

    it 'has Sign up button' do
      expect(rendered).to have_link('Sign up')
    end
  end

  context 'when user is signed in' do
    let(:user) { create(:user) }
    before do
      sign_in(user)
      render
    end
    it 'has Sign out link' do
      expect(rendered).to have_link('Sign out')
    end
  end
end
