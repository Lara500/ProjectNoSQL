class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_student, only: %i[ edit update show destroy ]

  # GET /students
  def index
    @students = Student.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @students }
    end
  end

  def edit
  end

  def new
    @student = Student.new
  end

  # GET /students/show
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @student }
    end
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    respond_to do |format|
    if @student.save
      format.html { redirect_to student_url(@student), notice: 'Pomyślnie utworzono profil studenta.' }
      format.json { render json: @student, status: :created, location: @student }
    else
      format.html { render :new }
      format.json { render json: @student.errors, status: :unprocessable_entity }
    end
  end
  end

  # PATCH/PUT
  def update    
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: 'Profil studenta został zaktualizowany.' }
        format.json { render json: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET
  def search
    query = params[:query]
    @students = Student.or(
      { name: /#{query}/i },
      { surname: /#{query}/i },
      { id: query }
    )

    respond_to do |format|
      format.html { render :search }
      format.json { render json: @students }
    end
  end

  def search_student

    @message = Message.find_by(id: params[:id])
    id_s = @message.student_id
    @student = Student.find_by(id: id_s)

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @student }
    end
    
  end

  # DELETE /students/delete
  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy

    redirect_to students_url, notice: 'Profil studenta został usunięty.', status: :see_other
  end

  private
    def set_student
      @student = Student.find_by(id: params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :surname, :email)
    end
end
