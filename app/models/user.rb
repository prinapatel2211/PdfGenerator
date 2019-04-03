class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :logo, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :descriptions, inverse_of: :user
  accepts_nested_attributes_for :descriptions, reject_if: :all_blank, allow_destroy: true
  attr_accessor :skip_password_validation  # virtual attribute to skip password validation while saving
  before_create :set_default_role

  protected

  def password_required?
    return false if skip_password_validation
    super
  end

  private

  def set_default_role
    self.role ||= 'user'
  end
end
