class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(:description)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end
end
