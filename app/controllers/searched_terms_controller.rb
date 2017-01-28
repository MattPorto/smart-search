class SearchedTermsController < ApplicationController
  def home
  end

  def index
    render json: SearchedTerm.terms_for(params[:term])
  end

  def new
    @searched_term = SearchedTerm.new
  end
  def create
    @searched_term = SearchedTerm.find_by(term: params[:search])
    unless @searched_term
      @searched_term = SearchedTerm.new(term: params[:search])
      @searched_term.save
    else
      @searched_term.increment! :popularity
    end
    redirect_to root_path
  end

end
