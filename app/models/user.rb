class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true
  has_many :created_help_requests, foreign_key: 'creator_id', class_name: HelpRequest
  has_many :assisted_help_requests, foreign_key: 'assistant_id', class_name: HelpRequest
  has_many :help_responses, foreign_key: 'responder_id'

  def received_help_responses
  	created_help_requests.collect(&:help_responses).flatten
  end
end
