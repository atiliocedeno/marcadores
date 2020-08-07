class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  # GET /types
  # GET /types.json
  def index
    @types = Type.all
  end

  # GET /types/1
  # GET /types/1.json
  def show
    response = @type.as_json
    response[:bookmarks] = @type.bookmarks.as_json
    response[:children] = @type.all_children
    respond_to do |format|
        format.js { render json: response }
        format.html { render json: response }
    end
  end



  # GET /types/new
  def new
    @type = Type.new
    @types = Type.all
    @categories = Category.all
  end

  # GET /types/1/edit
  def edit
    @types = Type.all
    @categories = Category.all
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(type_params)

    respond_to do |format|
      @types = Type.all
      @type_new = Type.new
      @categories = Category.all
      if @type.save
        format.js {render nothing: true} 
        # format.js {render layout: false, notice: 'Post was successfully created.'} 
        format.html { redirect_to @type, notice: 'Type was successfully created.' }
        format.json { render :show, status: :created, location: @type }
      else
        format.html { render :new }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    respond_to do |format|
      if @type.update(type_params)
        format.js {render layout: false} 
        format.html { redirect_to @type, notice: 'Type was successfully updated.' }
        format.json { render :show, status: :ok, location: @type }
      else
        format.html { render :edit }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type.destroy
    respond_to do |format|
      format.html { redirect_to types_url, notice: 'Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_params
      params.require(:type).permit(:name, :visible, :category_id, :type_id)
    end
end
