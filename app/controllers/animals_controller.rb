class AnimalsController < ApplicationController
  def index
    render json: Animal.all
  end
  def show
    render json: Animal.find(params[:id])
  end
  def create
    animal = Animal.create(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors
    end
  end
  def delete
    animal = Animal.find(params[:id])
    animal.destroy
    render json: Animal.all
  end
  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)
    if animal.valid?
      render json: Animal.all?
    else
      render json: Animal.errors
    end
  end
  def destroy
      animal = Animal.find(params[:id]).delete
      render json: 'deleted'
  end
  private
  def animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom)
  end
end
