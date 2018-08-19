require_relative '../rspec_helper'


RSpec.describe 'Log in:' do
  context 'Log in successfully' do
    it 'should be true' do
      home_page.load

      email = TEST_DATA['LOGIN']['VALID_EMAIL']
      pass = TEST_DATA['LOGIN']['VALID_PASS']
      home_page.login_with(email, pass)
      aggregate_failures do
        expect(home_page).to have_user_menu_btn
      end

    end
  end

end