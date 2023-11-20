class Student
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :surname, type: String
  field :email, type: String
  has_many :messages
end
