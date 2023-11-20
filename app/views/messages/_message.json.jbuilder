json.extract! message, :id, :student_email, :recipient_email, :title, :description, :student_id, :created_at, :updated_at
json.url message_url(message, format: :json)
