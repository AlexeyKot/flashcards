module LoginHelper
    def login_user(email, password)
      visit log_in_url

      fill_in 'email',    with: email
      fill_in 'password', with: password

      click_button 'Вход'
    end
end
