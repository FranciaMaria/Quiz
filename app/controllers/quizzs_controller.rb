class QuizzsController < ApplicationController
  before_action :set_quizz, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate, :except => [:home, :answering, :answer, :check]
  # GET /quizzs
  # GET /quizzs.json
  def index
    @quizzs = Quizz.all
  end

  # GET /quizzs/1
  # GET /quizzs/1.json
  def show
  end

  # GET /quizzs/new
  def new
    @quizz = Quizz.new
  end

  # GET /quizzs/1/edit
  def edit
  end

  # POST /quizzs
  # POST /quizzs.json
  def create
    @quizz = Quizz.new(quizz_params)

    respond_to do |format|
      if @quizz.save
        format.html { redirect_to @quizz, notice: 'Quizz was successfully created.' }
        format.json { render :show, status: :created, location: @quizz }
      else
        format.html { render :new }
        format.json { render json: @quizz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzs/1
  # PATCH/PUT /quizzs/1.json
  def update
    respond_to do |format|
      if @quizz.update(quizz_params)
        format.html { redirect_to @quizz, notice: 'Quizz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quizz }
      else
        format.html { render :edit }
        format.json { render json: @quizz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzs/1
  # DELETE /quizzs/1.json
  def destroy
    @quizz.destroy
    respond_to do |format|
      format.html { redirect_to quizzs_url, notice: 'Quizz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # GET /quizzs/answering/1
  
  def answering
    @quizzs = Quizz.all
  end
  
  #GET /quizz/answer/1
  
  def answer
    @quizz = Quizz.find(params[:id])
  end
  
  def check
    #@count = 0
    @quizz = Quizz.find(params[:id])
	respond_to do |format|
	  if params[:ans][0].to_i == @quizz.correctAns
	    #@count += 1
	    #flash.now[:notice] = '<b>Congratulation. You gave the correct answer to the question: ' + @quizz.question + '</b>'
		#format.html {redirect_to answering_url, notice: 'Congratulation. You gave the correct answer to the question: ' + @quizz.question + 'Your score is: ' + @count.to_s}
		format.html {redirect_to answering_url, notice: 'Congratulation. You gave the correct answer to the question: ' + @quizz.question}
		#format.json { render :show, status: :ok, location: answering_path }
	  else
	    #@count = 0
	    #flash.now[:notice] = "<b style='color: red'>I am sorry but that is not the right answer to the question: " + @quizz.question + "</b>"
		#format.html {redirect_to answering_url, notice: 'I am sorry but that is not the right answer to the question: ' + @quizz.question + 'Your score is: ' + @count.to_s}
		format.html {redirect_to answering_url, notice: 'I am sorry but that is not the right answer to the question: ' + @quizz.question}
		#format.json { render :show, status: :ok, location: answering_path }
      end	  
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizz
      @quizz = Quizz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizz_params
      params.require(:quizz).permit(:question, :ans1, :ans2, :ans3, :correctAns)
    end
	
	def authenticate
	  authenticate_or_request_with_http_basic do |name, password|
	    name == "maria" && password == "meteorologija"
	  end
	end
	
end
