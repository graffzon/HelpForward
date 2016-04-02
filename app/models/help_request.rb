class HelpRequest < ActiveRecord::Base
  belongs_to :creator, class_name: User
  belongs_to :assistant, class_name: User

  validates :title, presence: true

  enum category: ["Физическая помощь", "Материальная помощь"]


  def self.not_mine(user)
  	where.not(creator:  user)
  end
end
