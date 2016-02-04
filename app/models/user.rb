class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :attendances
  has_many :rituals, :through => :attendances

  has_many :user_turn, :class_name => "Ritual", :foreign_key => "user_turn"

  has_many :posts

  validates :handle, :uniqueness => true
end
