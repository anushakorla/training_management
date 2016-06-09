class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    @program = Program.find(params[:program_id])
    @levels = @program.levels
    
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
    @program = Program.find(params[:program_id])
    @level = @program.levels.find(params[:id])
  end

  # GET /levels/new
  def new
    @program = Program.find(params[:program_id])
    @level = @program.levels.build
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels
  # POST /levels.json
  def create
    @program = Program.find(params[:program_id])
    @level = @program.levels.build(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to program_levels_path(@program)}
        flash[:success] = 'Level was successfully created.' 
        format.json { render :show, status: :created, location: program_levels_path(@program) }
      else
        format.html { render :new }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    @program = Program.find(params[:program_id])
    @level = @program.levels.find(params[:id])
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to [@level.program,@level]}
        flash[:success] = 'Level was successfully updated.' 
        format.json { render :show, status: :ok, location: [@level.program,@level] }
      else
        format.html { render :edit }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @program = Program.find(params[:program_id])
    @level = @program.levels.find(params[:id]) 
    @level.destroy
    respond_to do |format|
      format.html { redirect_to program_levels_url}
      flash[:success] = 'Level was successfully destroyed.' 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
     @program = Program.find(params[:program_id])
     @level = @program.levels.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:name, :duration,:program_id,:start_date,:end_date)
    end
end
