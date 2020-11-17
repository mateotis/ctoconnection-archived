require 'rails_helper'

feature 'events index', type: :feature do
  before { OmniAuth.config.test_mode = true }
  after { OmniAuth.config.test_mode = false }

  let!(:event_1) { FactoryBot.create(:event) }
  let!(:event_2) { FactoryBot.create(:event) }

  context 'admin is logged in' do
    before(:each) do
      login_as_admin
      visit admin_events_path
    end

    it 'should have events text' do
      expect(page).to have_content('Events')
    end

    it 'should have new event button' do
      expect(page).to have_link('New event')
    end

    context 'events table' do
      it 'should have proper headers' do
        header_row = page.all('table thead tr')[0]
        expect(header_row.text).to eq('Id Title Starts Ends Sessions')
      end

      it 'should display events' do
        within 'table' do
          [event_1, event_2].each do |event|
            expect(page).to have_content(event_row(event))
          end
        end
      end
    end
  end

  context 'admin is not logged in' do
    before(:each) do
      visit admin_events_path
    end

    it 'should redirect to home page' do
      expect(page).to have_content('Login')
    end
  end

  context 'user without admin permissions is logged in' do
    before(:each) do
      login_as_attendee
      visit admin_events_path
    end

    it 'should redirect to home page' do
      expect(page).to have_content('Login')
    end
  end

  def event_row(event)
    [event.id, event.title, event.starts, event.ends,
     "#{event.sessions.count} sessions"].reject(&:blank?).join(' ')
  end
end
