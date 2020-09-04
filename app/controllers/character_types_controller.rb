# frozen_string_literal: true

# Character Types Controller
class CharacterTypesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_character_type, only: [:show, :edit, :update, :destroy]

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

    if @character_type.save
      redirect_to @character_type
    else
      render :new
    end
  end

  def update
    if @character_type.update(character_type_params)
      redirect_to @character_type
    else
      render :edit
    end
  end

  def destroy
    @character_type.destroy
    redirect_to character_types_url
  end

  private

  def set_character_type
    @character_type = CharacterType.find(params[:id])
  end

  def character_type_params
    params.require(:character_type).permit(:name, :avatar, character_attributes_attributes: [:name, :value, :icon, :_destroy])
  end
end
