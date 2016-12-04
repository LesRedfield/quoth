class QuotesController < ApplicationController

  def new

  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.age && @quote.age < 18
      flash.now[:errors] = ["#{@quote.name} is not eligible for a life insurance policy."]
      render :new
    elsif @quote.save
      if params[:conditions]
        params[:conditions].each do |condition_id|
          @quote.add_condition(condition_id)
        end
      end

      @price = @quote.generate_price
      render :new
    else
      flash.now[:errors] = @quote.errors.full_messages
      render :new
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:name, :city, :state_id, :age, :gender)
  end
end
