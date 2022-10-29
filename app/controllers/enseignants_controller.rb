class EnseignantsController < ApplicationController
  def index
    @enseignants = Enseignant.all
  end

  def show
    @enseignant = Enseignant.find(params[:id])
  end

  def new
    @enseignant = Enseignant.new
  end

  def create
    @enseignants = Enseignant.new(enseignant_params)
    if @enseignant.save
      # render json: @enseignants, status: :created, data: @enseignant
      redirect_to enseignants_path, notice: 'Vous avez ajouter un enseignant :-)'
    else
      # render json: @enseignants.errors, status: :unprocessable_entity
      render :new, alert: 'Impossible d\'enregistrer cet enseignant !'
    end
  end

  def update
    if @enseignant.update(enseignant_params)
      render json: @enseignant
    else
      render json: @enseignant.errors, status: :unprocessable_entity 
    end
  end

  def destroy
    @enseignant.destroy
  end

  private

  def set_enseignant
    @enseignant = Enseignant.find(params[:id])
  end

  def enseignant_params
    params.require(:enseignant).permit(:nom, :age, :diplome, :sexe)
  end
end
