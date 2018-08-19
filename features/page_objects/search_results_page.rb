class SearchResultsPage < SitePrism::Page


  element :more_filters_btn,             'button[data-rf-test-id="filterButton"]'
  element :min_price_dropdown,            'div.form > div > div.RangeSelect.quickPrice > span:nth-child(1)'
  element :max_price_dropdown,            'div.form > div > div.RangeSelect.quickPrice > span:nth-child(3)'
  element :min_beds_dropdown,            'div.filterRow.bedsFilter.tinyBitLower > div > span:nth-child(1)'
  element :max_beds_dropdown,            'div.filterRow.bedsFilter.tinyBitLower > div > span:nth-child(3)'
  element :min_sqft_dropdown,            'div.filterRow.squareFeet > div > span:nth-child(1)'
  element :max_sqft_dropdown,            'div.filterRow.squareFeet > div > span:nth-child(3)'

  element :apply_filters_btn,            'button[data-rf-test-id="apply-search-options"]'

  element :result_table,                 'div.ReactDataTable.subrow > table > tbody'

  element :table_option_btn,              'span[data-rf-test-name="tableOption"]'


  def get_option_index (locator, value)
    all(locator).map(&:text).index(value) + 1
  end

  def apply_filters(opts = {})
    more_filters_btn.click

    # select minimum price
    min_price_dropdown.click
    option = get_option_index('div div.option', opts.fetch(:min_price))
    find('div.flyout').find("div.flyout > div > div:nth-child(#{option})").select_option

    # select maximum price
    max_price_dropdown.click
    option = get_option_index('div div.option', opts.fetch(:max_price))
    find('div.flyout').find("div.flyout > div > div:nth-child(#{option})").select_option

    # select minimum beds
    min_beds_dropdown.click
    option = get_option_index('div div.option', opts.fetch(:min_beds))
    find('div.flyout').find("div.flyout > div > div:nth-child(#{option})").select_option

    # select maximum beds
    max_beds_dropdown.click
    option = get_option_index('div div.option', opts.fetch(:max_beds))
    find('div.flyout').find("div.flyout > div > div:nth-child(#{option})").select_option

    # select minimum sq ft
    min_sqft_dropdown.click
    option = get_option_index('div div.option', opts.fetch(:min_sqft))
    find('div.flyout').find("div.flyout > div > div:nth-child(#{option})").select_option

    # select maximum sq ft
    max_sqft_dropdown.click
    option = get_option_index('div div.option', opts.fetch(:max_sqft))
    find('div.flyout').find("div.flyout > div > div:nth-child(#{option})").select_option

    apply_filters_btn.click
    table_option_btn.click

  end

  def max_price
    prices_list = []
    page.all('div.ReactDataTable.subrow > table > tbody tr').each do |tr|
      prices_list << tr.all('td')[3].text.gsub(/[$,]/,'').to_i
    end
    return prices_list.max
  end

  def max_beds
    beds_list = []
    page.all('div.ReactDataTable.subrow > table > tbody tr').each do |tr|
      beds_list << tr.all('td')[4].text.to_f
    end
    return beds_list.max
  end

  def max_sqft
    sqft_list = []
    page.all('div.ReactDataTable.subrow > table > tbody tr').each do |tr|
      sqft_list << tr.all('td')[4].text.gsub(/[,]/,'').to_i
    end
    return sqft_list.max
  end

end



