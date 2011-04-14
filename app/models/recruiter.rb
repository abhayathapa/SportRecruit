class Recruiter < ActiveRecord::Base

  has_many :offers, :dependent => :destroy

  belongs_to :person

end

# == Schema Information
#
# Table name: recruiters
#
#  id            :integer         not null, primary key
#  nickname      :string(255)
#  establishment :date
#  country       :string(255)
#  coach         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  person_id     :integer
#

