module ControllerMacros
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin)
    end
  end

  def login_customer
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:customer]
      customer = FactoryBot.create(:customer)
      sign_in customer
    end
  end
end
