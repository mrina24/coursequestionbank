class Instructor < ActiveRecord::Base

  attr_accessible :privilege, :name, :uid, :privilege
  has_and_belongs_to_many :collections
  has_and_belongs_to_many :problems
  
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.privilege = "admin"
    end
  end

end
