class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:view]
  before_action :assertion, only: [:view]
  def index
  end

  def assertion
    n, m = params[:n].to_i, params[:m].to_i
    if (n.zero? || n.nil?) || (m.zero? || m.nil?)
      flash[:alert] = 'You cannot enter zeroes or nil values!, try again'
      redirect_to action: :index and nil
    end
  end

  def view
    @nod = calculate
    @nok = (params[:n].to_i * params[:m].to_i) / calculate
    @n = params[:n].to_i
    @m = params[:m].to_i
    puts params.inspect
    render partial: 'view'
  end

  private

  def calculate
    n = params[:n].to_i
    m = params[:m].to_i
    n, m = m, n % m while m != 0
    n
  end

end
