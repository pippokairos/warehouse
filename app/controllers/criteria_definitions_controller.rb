class CriteriaDefinitionsController < ApplicationController

  before_action :set_criteria_definition, only: [:show, :edit, :update, :destroy]

  def index
    @criteria_definitions = CriteriaDefinition.all
  end

  def new
    @criteria_definition = CriteriaDefinition.new
  end
  
  def create
    @criteria_definition = CriteriaDefinition.new(criteria_definition_params)
    if @criteria_definition.save
      redirect_to criteria_definition_path(@criteria_definition)
    else
      flash[:error] = "Criteria definition not valid: #{@criteria_definition.errors.full_messages.join(", ")}"
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @criteria_definition.update(criteria_definition_params)
      redirect_to criteria_definition_path(@criteria_definition)
    else
      flash[:error] = "Criteria definition not valid: #{@criteria_definition.errors.full_messages.join(", ")}"
      render :edit
    end
  end
  
  def destroy
    @criteria_definition.destroy
    flash[:success] = "Criteria definition #{@criteria_definition.id} deleted"
    redirect_to criteria_definitions_path
  end

  private

  def criteria_definition_params
    params.require(:criteria_definition).permit(
      { references: [] },
      { categories: [] },
      :max_price,
      :destination
    )
  end

  def set_criteria_definition
    @criteria_definition = CriteriaDefinition.find(params[:id])
  end
end
