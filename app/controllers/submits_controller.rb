class SubmitsController < ApplicationController
  before_action :set_submit, only: [:show, :edit, :update, :destroy]

  # GET /submits
  # GET /submits.json
  def index
    @users = User.all
    @test = Test.find(params[:test_id])
    @submits = @test.submits
  end

  # GET /submits/1
  # GET /submits/1.json
  def show
    @test = Test.find(params[:test_id])
    @submit = @test.submits.find(params[:id])
  end

  # GET /submits/new
  def new
    @test = Test.find(params[:test_id])
    @submit = @test.submits.build
  end

  # POST /submits
  # POST /submits.json
  def create
   @test = Test.find(params[:test_id])
   @submit = @test.submits.create(submit_params)
   @admin = Admin.last
   @user = current_user
    respond_to do |format|
      if @submit.save
        @submit.update(user_id: current_user.id)
        TestSubmissionAdmin.submission_email(@admin,@submit,@user).deliver_now
        format.html { redirect_to [@submit.test,@submit]}
        flash[:success] =  'Code was successfully submitted.' 
        format.json { render :show, status: :created, location: [@submit.test,@submit] }
      else
        format.html { render :new }
        format.json { render json: @submit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submits/1
  # DELETE /submits/1.json
  def destroy
    @test = Test.find(params[:test_id])
    @submit = @test.submits.find(params[:id])
    @submit.destroy
    respond_to do |format|
      format.html { redirect_to test_submits_url}
      flash[:success] =  'Code was successfully destroyed.' 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submit
      @test = Test.find(params[:test_id])
    @submit = @test.submits.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submit_params
      params.require(:submit).permit(:title, :code,:test_id,:user_id)
    end
end
