class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, foreign_key: 'user_id', class_name: 'Food', dependent: :delete_all
  has_many :recipes, foreign_key: 'user_id', class_name: 'Recipe', dependent: :delete_all

  validates :name, presence: true
end
