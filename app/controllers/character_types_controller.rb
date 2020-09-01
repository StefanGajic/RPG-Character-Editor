class CharacterTypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_character_type, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def index
    @character_types = CharacterType.page params[:page]
  end

  def my_characters
    @character_types = current_user.character_types.page params[:page]
  end

  def show
  end

  def new
    @character_type = CharacterType.new

    @character_type.character_attributes.build
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
    params.require(:character_type).permit(:name, :avatar, character_attributes_attributes: [:name, :value, :icon, :_destroy])
  end

  def logged_in_user
    if current_user != @character_type.user
      redirect_to character_type_path
    end
  end
end
