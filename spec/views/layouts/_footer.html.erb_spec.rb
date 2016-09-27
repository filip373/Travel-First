# frozen_string_literal: true
require 'rails_helper'

describe 'layouts/_footer.html.erb', type: :view do
  before do
    assign(:feedback, FeedbackForm.new)
    render
  end

  it 'has GitHub link' do
    expect(rendered).to have_link('', href: 'https://github.com/filip373/Travel-First')
  end

  it 'has LinkedIn link' do
    expect(rendered).to have_link('', href: 'https://pl.linkedin.com/in/filip-soszynski')
  end
end
