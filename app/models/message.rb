class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :student_email, type: String
  field :recipient_email, type: String
  field :title, type: String
  field :description, type: String
  field :student_id, type: Integer
  belongs_to :student
end
