require 'capybara/rspec'

Capybara.register_driver :chrome do |app|

    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        # 手動でchromedriverのパスを指定
        driver_path = "C:/Users/haru2/Downloads/chromedriver-win64/chromedriver-win64/chromedriver.exe"
        options: Selenium::WebDriver::Chrome::Options.new.tap do |opts|
        opts.add_argument('--headless') 
        opts.add_argument('--disable-gpu')
        opts.add_argument('--window-size=1400,1400')
    end
    )
end

Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome
