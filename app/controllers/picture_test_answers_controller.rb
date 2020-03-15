class PictureTestAnswersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_picture_test_answer, only: [:show, :edit, :update, :destroy]

  # GET /picture_test_answers
  # GET /picture_test_answers.json
  def index
    @picture_test_answers = PictureTestAnswer.all
  end

  # GET /picture_test_answers/1
  # GET /picture_test_answers/1.json
  def show
  end

  # GET /picture_test_answers/new
  def new
    @picture_test_answer = PictureTestAnswer.new
  end

  # GET /picture_test_answers/1/edit
  def edit
  end

  # POST /picture_test_answers
  # POST /picture_test_answers.json
  def create
    @picture_test_answer = PictureTestAnswer.new(picture_test_answer_params)

    respond_to do |format|
      if @picture_test_answer.save
        format.html { redirect_to @picture_test_answer, notice: 'Picture test answer was successfully created.' }
        format.json { render :show, status: :created, location: @picture_test_answer }
      else
        format.html { render :new }
        format.json { render json: @picture_test_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picture_test_answers/1
  # PATCH/PUT /picture_test_answers/1.json
  def update
    respond_to do |format|
      if @picture_test_answer.update(picture_test_answer_params)
        format.html { redirect_to @picture_test_answer, notice: 'Picture test answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture_test_answer }
      else
        format.html { render :edit }
        format.json { render json: @picture_test_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picture_test_answers/1
  # DELETE /picture_test_answers/1.json
  def destroy
    @picture_test_answer.destroy
    respond_to do |format|
      format.html { redirect_to picture_test_answers_url, notice: 'Picture test answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def answer_submission
    if params[:email_address].present?
      @user = User.find_by(email: params[:email_address])

      if !@user
        @user = User.create(email: params[:email_address], user_name: params[:user_name], password: "123456")
      else
        @user.picture_test_answers.delete_all
      end
      PictureTestAnswer.create_answers(@user.id, params[:questions])

      @result = PictureTestAnswer.calculate_personality(@user.reload)
    end

    respond_to do |format|
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture_test_answer
      @picture_test_answer = PictureTestAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_test_answer_params
      params.require(:picture_test_answer).permit(:extent, :user_id, :picture_test_id)
    end
end
