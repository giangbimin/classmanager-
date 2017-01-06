class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_and_belongs_to_many :roles
  
  validates :name, presence: true

  scope :student, -> { joins(:roles).where("roles.name = ?", 'student') }
  scope :except_mentor, -> { joins(:roles).where.not("roles.name = ?", 'mentor') }
  default_scope { order('create_at DESC') }

  def admin?
    roles.any? do |role|
      role.admin?
    end
  end

  def subamin?
    roles.any? do |role|
      role.subamin?
    end
  end

  def staff?
    roles.any? do |role|
      role.staff?
    end
  end

  def student?
    roles.any? do |role|
      role.student?
    end
  end

  def mentor?
    roles.any? do |role|
      role.mentor?
    end
  end

  def register?
    roles.any? do |role|
      role.register?
    end
  end

 def highest_role
    return 'admin' if admin?
    return 'subadmin' if subadmin?
    return 'staff' if staff?
    return 'mentor' if mentor?
    return 'student' if student?
    return 'register' if register?
    return 'N/A'
  end
end
