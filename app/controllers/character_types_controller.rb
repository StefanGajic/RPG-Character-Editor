class CharacterTypesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_character_type, only: [:show, :edit, :update, :destroy]

  def index
    @character_types = CharacterType.page params[:page]
  end

  def show
  end

  def new
    @character_type = CharacterType.new
  end

  def edit
  end

  def create
    @character_type = CharacterType.new(character_type_params)

    @character_type.user = current_user

    respond_to do |format|
      if @character_type.save
        format.html { redirect_to @character_type }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @character_type.update(character_type_params)
        format.html { redirect_to @character_type }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @character_type.destroy
    respond_to do |format|
      format.html { redirect_to character_types_url }
    end
  end

  private

  def set_character_type
    @character_type = CharacterType.find(params[:id])
  end

  def character_type_params
    params.require(:character_type).permit(:name, :avatar)
  end

end
