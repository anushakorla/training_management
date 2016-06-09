class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @level = Level.find(params[:level_id])
    @tests = @level.tests
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @level = Level.find(params[:level_id])
    @test = @level.tests.find(params[:id])
  end

  # GET /tests/new
  def new
    @level = Level.find(params[:level_id])
    @test = @level.tests.build
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @level = Level.find(params[:level_id])
    @test = @level.tests.create(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to level_tests_path(@level)}
        flash[:success] = 'Test was successfully created.' 
        format.json { render :show, status: :created, location: level_tests_path(@level) }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    @level = Level.find(params[:level_id])
    @test = @level.tests.find(params[:id])
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to level_tests_path(@level)}
         flash[:success] = 'Test was successfully updated.' 
        format.json { render :show, status: :ok, location: level_tests_path(@level) }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @level = Level.find(params[:level_id])
    @test = @level.tests.find(params[:id])
    @test.destroy
    respond_to do |format|
      format.html { redirect_to level_tests_url}
       flash[:success] = 'Test was successfully destroyed.' 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
     @level = Level.find(params[:level_id])
     @test = @level.tests.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:title, :description, :duration, :date, :level_id)
    end
end
