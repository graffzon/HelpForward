class HelpRequest < ActiveRecord::Base
  belongs_to :creator, class_name: User
  belongs_to :assistant, class_name: User
  has_many :help_responses

  validates :title, presence: true

  enum category: ["Физическая помощь", "Материальная помощь"]
  enum status: [:requested, :completed]


  def self.not_mine(user)
    where.not(creator:  user)
  end

  # Мне помогли
  def self.mine_completed(user)
    where(creator: user, status: 1)
  end
end
