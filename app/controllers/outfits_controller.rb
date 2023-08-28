class OutfitsController < ApplicationController

  private

  def outfit_params
    params.require(:outfit).permit(, photos: []) # ADD PARAMS AS NEEDED, KEEP THE PHOTOS ARRAY.
  end
end
