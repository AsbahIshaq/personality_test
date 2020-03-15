class PictureTestsController < ApplicationController
  before_action :set_picture_test, only: [:show, :edit, :update, :destroy]

  # GET /picture_tests
  # GET /picture_tests.json
  def index
    @picture_tests = PictureTest.all
  end

  # GET /picture_tests/1
  # GET /picture_tests/1.json
  def show
  end

  # GET /picture_tests/new
  def new
    @picture_test = PictureTest.new
  end

  # GET /picture_tests/1/edit
  def edit
  end

  # POST /picture_tests
  # POST /picture_tests.json
  def create
    @picture_test = PictureTest.new(picture_test_params)

    respond_to do |format|
      if @picture_test.save
        format.html { redirect_to @picture_test, notice: 'Picture test was successfully created.' }
        format.json { render :show, status: :created, location: @picture_test }
      else
        format.html { render :new }
        format.json { render json: @picture_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picture_tests/1
  # PATCH/PUT /picture_tests/1.json
  def update
    respond_to do |format|
      if @picture_test.update(picture_test_params)
        format.html { redirect_to @picture_test, notice: 'Picture test was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture_test }
      else
        format.html { render :edit }
        format.json { render json: @picture_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picture_tests/1
  # DELETE /picture_tests/1.json
  def destroy
    @picture_test.destroy
    respond_to do |format|
      format.html { redirect_to picture_tests_url, notice: 'Picture test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture_test
      @picture_test = PictureTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_test_params
      params.require(:picture_test).permit(:image_url, :title)
    end
end
