require_relative '../rspec_helper'


RSpec.describe 'Property search:' do
  context 'With applied filters' do
    it 'should display filtered properties' do
      home_page.load
      zip_code = TEST_DATA['SEARCH']['ZIP_CODE']
      home_page.search_for_property(zip_code)
      search_results_page.apply_filters(min_price: TEST_DATA['FILTERS']['MIN_PRICE'],
                                        max_price: TEST_DATA['FILTERS']['MAX_PRICE'],
                                        min_beds: TEST_DATA['FILTERS']['MIN_BEDS'],
                                        max_beds: TEST_DATA['FILTERS']['MAX_BEDS'],
                                        min_sqft: TEST_DATA['FILTERS']['MIN_SQFT'],
                                        max_sqft: TEST_DATA['FILTERS']['MAX_SQFT'])
      aggregate_failures do
        max_price = (TEST_DATA['FILTERS']['MAX_PRICE']).gsub(/[$k]/,'000').to_i
        expect(max_price).to be >= search_results_page.max_price
        max_beds = TEST_DATA['FILTERS']['MAX_BEDS'].to_f
        expect(max_beds).to be >= search_results_page.max_beds
        max_sqft = TEST_DATA['FILTERS']['MAX_SQFT'].gsub(/[,]/,'').to_i
        expect(max_sqft).to be >= search_results_page.max_sqft
      end

    end
  end

end