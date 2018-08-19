class HomePage < SitePrism::Page
  set_url 'https://www.redfin.com'

  element :login_btn,                 'button[data-rf-test-name="SignInLink"]'

  element :email_field,               'input[name="emailInput"]'
  element :password_field,            'input[name="passwordInput"]'
  element :continue_with_email_btn,    'button[data-rf-test-name="submitButton"]'
  element :sign_in_btn,                'div.submitButtonWrapper > button > span'

  element :user_menu_btn,              '#userMenu'

  element :search_field,               '#search-box-input'
  element :search_btn,                 'div.content.current > div > div > div > form > div > button'


  def login_with(user, pass)
    login_btn.click
    continue_with_email_btn.click
    email_field.set(user)
    password_field.set(pass)
    sign_in_btn.click
  end

  def search_for_property(location)
    search_field.set(location)
    search_btn.click
  end

end