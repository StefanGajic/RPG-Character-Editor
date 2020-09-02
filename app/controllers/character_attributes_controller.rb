# frozen_string_literal: true

# Character Attributes Controller
class CharacterAttributesController < ApplicationController
  load_and_authorize_resource :character_type
  load_and_authorize_resource :character_attribute, through: :character_type
  before_action :set_character_type
  before_action :set_character_attribute, only: %i[update destroy]

  def create
    @character_attribute = @character_type.character_attributes.build(character_attribute_params)

    respond_to do |format|
      if @character_attribute.save
        format.js
        format.html { redirect_to @character_type }
      end
    end
  end

  def update
    respond_to do |format|
      if @character_attribute.update(character_attribute_params)
        format.js
        format.html { redirect_to @character_type }
      end
    end
  end

  def destroy
    @character_attribute.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to @character_type }
    end
  end

  private

  def set_character_attribute
    @character_attribute = @character_type.character_attributes.find(params[:id])
  end

  def character_attribute_params
    params.require(:character_attribute).permit(:name, :value, :icon, :character_type_id)
  end

  def set_character_type
    @character_type = CharacterType.find(params[:character_type_id])
  end
end
