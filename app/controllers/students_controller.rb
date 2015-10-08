class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
# load_and_authorize_resource
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

  end

def student_mail
@student = Student.find(params[:id])
end

def mail
  @subject = params[:subject]
  @message = params[:message]
  @student = Student.find(params[:id])
  SendEmail.signup_notify(@student.email,@subject,@message).deliver_now
  redirect_to students_path
  flash[:notice]= "Email send successfully"
end
  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

      if @student.save
        SendEmail.send_notification(@student.email,@student.name).deliver_now
        redirect_to students_path
        flash[:notice]= "Student created successfully"
      else
        render 'new'
      end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
authorize! :destory,@student
    
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :email)
    end
end
