class AlonhadatCreator
  attr_accessor :name, :phone_number, :title, :description, :district, :province

  def initialize params
    # @name = args[:name]
    # @phone_number = args[:phone_number]
    # @title = args[:title]
    # @description = args[:description]
    # @district = args[:district]
    # @province = args[:province]
    @params = params
  end

  def perform
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])

    driver = Selenium::WebDriver.for(:chrome, options: options)
    driver.get('https://alonhadat.com.vn')

    # dang ky

    driver.find_element(class_name: 'register').click

    byebug
    sleep(0.2)

    driver.find_element(id: 'account').send_keys('mutiland-test-2')
    driver.find_element(id: 'password1').send_keys('Ketcdlena1@@')
    driver.find_element(id: 'password2').send_keys('Ketcdlena1@@')
    driver.find_element(id: 'username').send_keys('Nguyen Ngọc Khánh')
    driver.find_element(id: 'phone1').send_keys('0868027111')
    driver.find_element(id: 'email1').send_keys(@params[:email] || 'mutiland-test-2@gmail.com')
    driver.find_element(id: 'email2').send_keys(@params[:email] || 'mutiland-test-2@gmail.com')
    # driver.find_element(id: 'register_province').send_keys(1)

    drop1 = driver.find_element(:id, "register_province")
    choose = Selenium::WebDriver::Support::Select.new(drop1)
    choose.select_by(:text, "Đà Nẵng")
    # driver.find_element(id: 'register_district').send_keys(420)

    drop2 = driver.find_element(:id, "register_district")
    choose = Selenium::WebDriver::Support::Select.new(drop2)
    choose.select_by(:text, "Quận Hải Châu")

    driver.find_element(id: 'agent1').click
    # @c = 6868
    # src = driver.find_element(class_name: 'captchagenerator').property('src')
    # byebug
    driver.find_element(id: 'captcha').send_keys(662)
    driver.find_elements(class_name: 'register').last.click

    # while driver.find_element(class_name: 'register-form').text.include? "Mã an toàn không đúng." do
    #   driver.find_element(class_name: 'fail').click
    #   driver.find_elements(class_name: 'register').last.click
    #   sleep(0.01)
    # end

    # byebug
    # # dang ky

    # agent1


    # login = driver.find_element(class_name: 'login')
    # login.click
    # account = driver.find_element(id: 'account')
    # password = driver.find_element(id: 'password')
    # account.send_keys('gindeptrai')
    # password.send_keys('Ketcdlena1@@')
    # login_form = driver.find_element(id: 'login-form')
    # login_submit = login_form.find_element(class_name: 'login')
    # login_submit.click

    driver.quit
  end
end
