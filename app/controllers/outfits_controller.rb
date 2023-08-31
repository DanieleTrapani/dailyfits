class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.all
    # TODO: Filter by weather condition where they match the outfit tags
  end

  def show
    id = params[:id]
    @outfit = Outfit.find(id)
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user

    # TODO: generate tag, if existing append outfit, if not create and append

    if @outfit.save
      today = WeatherApi.get_day(0, 'Amsterdam')
      tag_params = WeatherApi.create_tag(today)
      tag = Tag.new(tag_params)
      if tag.valid?
        tag.save
      else
        tag = Tag.where(tag_params)
      end
      tag.outfits << @outfit
      redirect_to outfit_path(@outfit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    id = params[:id]
    @outfit = Outfit.find(id)
  end

  def update
    @outfit = Outfit.new
  end

  def destroy
    id = params[:id]
    Outfit.destroy(id)
    redirect_to outfits_path, status: :see_other
  end

  private

  def outfit_params
    params.require(:outfit).permit(:description, photos: []) # ADD PARAMS AS NEEDED, KEEP THE PHOTOS ARRAY.
  end
end
