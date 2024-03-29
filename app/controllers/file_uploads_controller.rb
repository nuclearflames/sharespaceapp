class FileUploadsController < ApplicationController
  before_filter :set_user
  before_action :authenticate_user!
  before_action :authenticate_current_user!
  before_action :set_file_upload, only: [:edit, :update, :destroy]

  # GET /file_uploads
  # GET /file_uploads.json
  def index
    @file_uploads = FileUpload.where(:user_id => params[:user_id])
  end

  # GET /file_uploads/1
  # GET /file_uploads/1.json
  def show
    @file_upload = FileUpload.where(:id => params[:id], :user_id => params[:user_id]).first
  end

  # GET /file_uploads/new
  def new
    @file_upload = FileUpload.new
  end

  # GET /file_uploads/1/edit
  def edit
  end

  # POST /file_uploads
  # POST /file_uploads.json
  def create
    @file_upload = FileUpload.new(file_upload_params)
    @file_upload.user_id = current_user.id

    respond_to do |format|
      if @file_upload.save
        format.html { redirect_to file_upload_path(@user, @file_upload), notice: 'File upload was successfully created.' }
        format.json { render :show, status: :created, location: @file_upload }
      else
        format.html { render :new }
        format.json { render json: @file_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_uploads/1
  # PATCH/PUT /file_uploads/1.json
  def update
    respond_to do |format|
      if @file_upload.update(file_upload_params)
        format.html { redirect_to file_upload_path(@user, @file_upload), notice: 'File upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_upload }
      else
        format.html { render :edit }
        format.json { render json: @file_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_uploads/1
  # DELETE /file_uploads/1.json
  def destroy
    @file_upload.destroy
    respond_to do |format|
      format.html { redirect_to file_uploads_url, notice: 'File upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_upload
      @file_upload = FileUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_upload_params
      params.require(:file_upload).permit(:name, :description, :file, :private)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
