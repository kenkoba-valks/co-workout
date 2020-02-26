class TrainerController < ApplicationController
  def index
    @trainers = Trainer.all
  end
end