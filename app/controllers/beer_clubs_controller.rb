class BeerClubsController < ApplicationController
  before_action :set_beer_club, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in, except: [:show, :index]

	def index
		@beerclubs = BeerClub.all
	end


  def new
		@beerclub = BeerClub.new
	end

  def create

		@beerclub = BeerClub.new(beer_club_params)

    respond_to do |format|
      if @beerclub.save
        format.html { redirect_to beer_clubs_path, notice: 'Beerclub was successfully created.' }
        format.json { render :show, status: :created, location: @beerclub }
      else
        format.html { render :new }
        format.json { render json: @beerclub.errors, status: :unprocessable_entity }
      end
    end

  end


  private

  def beer_club_params
    params.require(:beer_club).permit(:name, :city)
  end

  def set_beer_club
    @beerclub = BeerClub.find(params[:id])
  end

end