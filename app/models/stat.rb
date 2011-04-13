class Stat < ActiveRecord::Base

  belongs_to :athlete

end

# == Schema Information
#
# Table name: stats
#
#  id          :integer         not null, primary key
#  athlete_id  :integer
#  matches     :integer
#  wins        :integer
#  losses      :integer
#  goals       :integer
#  assists     :integer
#  cleansheets :integer
#  position    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

