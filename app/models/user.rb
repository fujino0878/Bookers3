class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :login
  validates :name, presence:true,length: { minimum: 2, maximum: 20 }
  validates :introduction, {length: {maximum: 50}} 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :authentication_keys => [:login]
    def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
     if login = conditions.delete(:login)
      where(conditions).where(["name = :value OR lower(email) = lower(:value)", { :value => login }]).first
     else
      where(conditions).first
     end
    end
         has_many :post_images, dependent: :destroy
         has_many :books, dependent: :destroy
       attachment :profile_image
end
