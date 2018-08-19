Before do
  unless ENV['DRIVER'] == 'poltergeist'
    current_window.maximize
  end
end

After do |scenario|
  if scenario.failed?
    file_name = Time.now.strftime('%Y-%m-%d-%H:%M:%S.png').to_s
    scenario.attach_file('SCREENSHOT', File.open(save_screenshot("output/screenshots/#{file_name}"))) if ENV['REPORTS'] == 'ALLURE'
    File.open(save_screenshot("output/screenshots/#{scenario.name}_#{file_name}"))
  end
end