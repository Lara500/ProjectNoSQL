json.extract! student, :id, :name, :surname, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
