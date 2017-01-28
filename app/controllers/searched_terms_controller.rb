class SearchedTermsController < ApplicationController
  def home
  end

  def index
    render json: %w[foo bar]
  end
end
