class SecretCodesController < ApplicationController
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]

  def index
    @secret_codes = SecretCode.all
  end

  def show
  end

  def new
    @secret_code = SecretCode.new
  end

  def edit
  end

  def create
    max_range =  secret_code_params.values[0].to_i
    max_range.times do 
      @secret_code = SecretCode.new({"secret"=> rand(36**4).to_s(36)})
      @secret_code.save
    end
    redirect_to @secret_code, notice: 'Secret code was successfully created.'
  end

 
  def update
    respond_to do |format|
      if @secret_code.update(secret_code_params)
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully updated.' }
        format.json { render :show, status: :ok, location: @secret_code }
      else
        format.html { render :edit }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_secret_code
      @secret_code = SecretCode.find(params[:id])
    end

    def secret_code_params
      params.require(:secret_code).permit(:secret)
    end
end
