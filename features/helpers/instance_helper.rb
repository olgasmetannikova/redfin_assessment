require_relative '../../features/page_objects/home_page'
require_relative '../../features/page_objects/search_results_page'

module InstanceHelper


  def home_page
    @home_page ||= HomePage.new
  end

  def search_results_page
    @search_results_page ||= SearchResultsPage.new
  end

end

