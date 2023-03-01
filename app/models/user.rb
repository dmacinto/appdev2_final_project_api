# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  authentication_token   :string(30)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :tasks, class_name: "Task", foreign_key: "commenter_id", dependent: :destroy

  validates :username, 
    presence: true, 
    uniqueness: true,
    format: { 
      with: /\A[\w_\.]+\z/i,
      message: "can only contain letters, numbers, periods, and underscores"
      }

  validates :website, url: { allow_blank: true }
  
  before_validation :ensure_website_has_scheme

  def ensure_website_has_scheme
    if website.present? &&
      !website.starts_with?("http://") &&
      !website.starts_with?("https://")

      self.website = "http://" + self.website
    end
  end

end
