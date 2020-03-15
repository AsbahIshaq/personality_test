class ObjectiveTestsController < ApplicationController

  def index
    @objective_tests = ObjectiveTest.all
  end

  def show
    @objective_test = ObjectiveTest.find(params[:id])
  end

  def new
    @objective_test = ObjectiveTest.new
  end

  def create
    @objective_test = ObjectiveTest.new(objective_test_params)

    if @objective_test.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @objective_test = ObjectiveTest.find(params[:id])
  end

  def update
    @objective_test = ObjectiveTest.find(params[:id])

    if @objective_test.update_attributes(objective_test_params)
      redirect_to :action => 'show', :id => @objective_test
    else
      render :action => 'edit'
    end
  end

  def delete
    ObjectiveTest.find(params[:id]).destroy
  end

  def objective_test_params
    params.require(:objective_test).permit(:question)
  end

end