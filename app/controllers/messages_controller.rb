class MessagesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_message, only: %i[ show update destroy search_student]

  # GET /messages
  def index
    @student = Student.find_by(id: params[:student_id])
    @messages = @student.messages

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @messages }
    end
  end

  def new
    @student = Student.find(params[:student_id])
    @message = Message.new
  end

  # GET /messages/1
  def show
    
    @student = Student.find_by(id: params[:student_id])
    @message = @student.messages.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @message }
    end

  end

  # POST /messages
  def create

    @student = Student.find_by(id: params[:student_id])
    @message = @student.messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to student_message_path(student_id: @student.id, id: @message.id), notice: 'Wiadomość została utworzona.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /messages/1
  def destroy
    @student = Student.find_by(id: params[:student_id])
    @message.destroy
    redirect_to student_messages_path(@student), notice: 'Wiadomość została usunięta.', status: :see_other
  end

  private

    def set_message
      @message = Message.find_by(id: params[:id])
    end

    def message_params
      params.require(:message).permit(:student_email, :recipient_email, :title, :description, :student_id)
    end
    
end
