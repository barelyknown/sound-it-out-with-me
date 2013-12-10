class PhrasesController < ApplicationController

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)
    redirect_to @phrase.duplicate and return if @phrase.duplicate?
    if @phrase.save
      redirect_to @phrase
    else
      redirect_to root_path
    end
  end

  def show
    @phrase = Phrase.friendly.find(params[:id])
  end

private

  def phrase_params
    params.require(:phrase).permit([:language, :words])
  end

end
