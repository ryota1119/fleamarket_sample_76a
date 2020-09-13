class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true
  validates :password, length: { minimum: 7 },
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }       
  validates :email, presence: true, 
            uniqueness:true, length:{ maximum: 255 }, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }      
end
