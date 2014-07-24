class Followup < ActiveRecord::Base
  belongs_to :followupable, polymorphic: true
  belongs_to :followup_type
  belongs_to :user
  
  def has_next_str
    ["否","是"][self.has_next]
  end
  
  def is_finished_str
    ["否","是"][self.is_finished] unless self.is_finished.nil?
  end
end
