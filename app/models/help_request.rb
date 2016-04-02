class HelpRequest < ActiveRecord::Base
  belongs_to :creator, class_name: User
  belongs_to :assistant, class_name: User
end
