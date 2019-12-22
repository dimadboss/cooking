class MeasuresController < ApplicationController
  def index
    @measures = Measure.all
  end
end