class OutfitsController < ApplicationController
  def index
    tag = generate_tag
    @outfits = current_user.outfits.where(tag_id: tag.id).order(created_at: :desc)
  end

  def show
    @page = params[:test]
    id = params[:id]
    @outfit = Outfit.find(id)
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user

    tag = generate_tag

    tag.outfits << @outfit
    if @outfit.save
      redirect_to(outfit_path(@outfit))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @outfit = Outfit.find(params[:id])
  end

  def update
    @outfit = Outfit.find(params[:id])
    @outfit.update(outfit_params)
    redirect_to(outfit_path)
  end

  def destroy
    page = params[:page]
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    if page == "dashboard"
      redirect_to(dashboard_path, status: :see_other)
    else
      redirect_to(outfits_path, status: :see_other)
    end
  end

  private

  def outfit_params
    # INFO: ADD PARAMS AS NEEDED, KEEP THE PHOTOS ARRAY.
    params.require(:outfit).permit(:description, photos: [])
  end

  def generate_tag
    today = WeatherApi.get_day(0, current_user.location)
    tag_params = WeatherApi.create_tag(today)
    tag = Tag.new(tag_params)
    if tag.valid?
      tag.save
    else
      tag = Tag.where(tag_params).first
    end

    return tag
  end
end
