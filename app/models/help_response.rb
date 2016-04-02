class HelpResponse < ActiveRecord::Base
  belongs_to :responder, class_name: User
  belongs_to :help_request
end
