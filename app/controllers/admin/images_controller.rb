class Admin::ImagesController < Admin::BaseController

  skip_before_filter :set_navs, :parse_pagination_params

  def new
    ## Intitializing the image object
    image_type = params[:image_type] || "Image::Base"

    @image = image_type.constantize.new

    respond_to do |format|
      format.html { get_collections and render :index }
      format.json { render json: @image }
      format.js {}
    end
  end

  def edit

    ## Fetching the image object
    image_type = params[:image_type] || "Image::Base"
    @image = image_type.constantize.find(params[:id])

    respond_to do |format|
      format.html { get_collections and render :index }
      format.json { render json: @image }
      format.js {}
    end
  end

  def create

    ## Creating the image object
    image_type = params[:image_type] || "Image::Base"

    resource = params[:imageable_type].constantize.find params[:imageable_id]
    @image = image_type.constantize.new

    @image.imageable = resource

    @image.image = params[:image][:image]

    ## Setting redirect url
    @redirect_url = params[:redirect_url] || root_url

    ## Validating the data
    @image.valid?

    respond_to do |format|
      if @image.errors.blank?

        # Saving the admin object
        @image.save

        # Setting the flash message
        message = translate("forms.created_successfully", :item => "Image")
        set_flash_message(message, :success)

        format.html {
          redirect_to @redirect_url, notice: message
        }
        format.json { render json: @image, status: :created, location: @admin }
        format.js {}
      else

        # Setting the flash message
        message = @image.errors.full_messages.to_sentence
        set_flash_message(message, :alert)

        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def update

    # Get the image object and assign new image path to it
    image_type = params[:image_type] || "Image::Base"
    @image = image_type.constantize.find(params[:id])

    @image.image = params[:image][:image]
    @redirect_url = params[:redirect_url] || root_url

    ## Validating the data
    @image.valid?

    respond_to do |format|
      if @image.errors.blank?

        # Saving the admin object
        @image.save

        # Setting the flash message
        message = translate("forms.created_successfully", :item => "Image")
        set_flash_message(message, :success)

        format.html {
          redirect_to @redirect_url, notice: message
        }
        format.json { render json: @image, status: :created, location: @image }
        format.js {}
      else

        # Setting the flash message
        message = @image.errors.full_messages.to_sentence
        set_flash_message(message, :alert)

        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

end
