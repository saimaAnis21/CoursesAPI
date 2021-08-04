class CategoryNamesController < ApplicationController
  skip_before_action :authorize_request, only: :index
  def index
    @category_names = CategoryName.all
    json_response(@category_names)
  end
end
