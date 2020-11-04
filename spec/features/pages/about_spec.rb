require 'rails_helper'

describe 'About page' do
  it 'shows hello world text' do
    visit about_path
    expect(page).to have_content('Hello world!')
  end
end
