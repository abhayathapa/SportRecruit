class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :sport, :person_type, :password, :password_confirmation, :remember_me

  has_one :athlete , :dependent => :destroy
  has_one :recruiter, :dependent => :destroy

  validates :name, :presence => true
  validates :sport, :presence => true
  validates :person_type, :presence => true

  after_create :create_athlete_or_recruiter

  def self.search(search)
    if search
      Person.where('person_type'=>'Athlete').where('name LIKE ?',"%#{search}%")
    end
  end


  private
  def create_athlete_or_recruiter
    if self.person_type == "Athlete"
      self.build_athlete()
      self.athlete.build_stat()
    else
      self.build_recruiter()
    end
  end

end

# == Schema Information
#
# Table name: people
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  sport                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  person_type          :string(255)
#

