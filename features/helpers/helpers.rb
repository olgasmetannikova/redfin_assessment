module Helpers


  def click_btn(element)
    btn = "#{element.downcase.gsub(" ", "_").strip}_btn"
    self.method(btn.to_sym).call.click
  end

  def click_item(element)
    item = "#{element.downcase.gsub(" ", "_").strip}_item"
    self.method(item.to_sym).call.click
  end

  def hover_on(element)
    el = "#{element.downcase}"
    self.method(el.to_sym).call.hover
  end

  def select_option(element, value)
    element.find("option[value='#{value}']").select_option
  end

end