class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @level = Level.find(params[:level_id])
    @attachments = @level.attachments
    if params[:start_date]
      @user = current_user
      @admin = Admin.last
      StartTrainingAdmin.start_training_email(@admin, @level,@user).deliver_now
      StartTrainingUser.start_training_email(@user, @level).deliver_now
      @level.update(start_date: Time.now)
      @level.update(end_date: (@level.start_date + @level.duration.to_i.days))
      redirect_to level_attachments_path(@level)
      flash[:success] = "The #{@level.name} training has been started."
    end
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @level = Level.find(params[:level_id])
    @attachment = @level.attachments.find(params[:id])
  end

  # GET /attachments/new
  def new
    @level = Level.find(params[:level_id])
    @attachment = @level.attachments.build
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json
  def create
   @level = Level.find(params[:level_id])
    @attachment = @level.attachments.create(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to level_attachments_path(@level)}
        flash[:success] = 'Attachment was successfully created.' 
        format.json { render :show, status: :created, location: level_attachments_path(@level) }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    @level = Level.find(params[:level_id])
    @attachment = @level.attachments.find(params[:id])
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to level_attachments_path(@level)}
        flash[:success] = 'Attachment was successfully updated.' 
        format.json { render :show, status: :ok, location: level_attachments_path(@level) }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @level = Level.find(params[:level_id])
    @attachment = @level.attachments.find(params[:id])
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to level_attachments_url}
      flash[:success] = 'Attachment was successfully destroyed.' 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
     @level = Level.find(params[:level_id])
     @attachment = @level.attachments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:document,:name,:level_id)
    end
end
