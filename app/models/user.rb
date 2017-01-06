class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :role
  before_validation :default_role

  # validates :name, presence: true

  # scope :student, -> { joins(:roles).where("roles.name = ?", 'student') }
  # scope :except_mentor, -> { joins(:roles).where.not("roles.name = ?", 'mentor') }
  default_scope { order('created_at DESC') }

  def admin?
    self.role_id == Role.find_by_name('admin').id
  end

  def subadmin?
    self.role_id == Role.find_by_name('subadmin').id
  end

  def staff?
    self.role_id == Role.find_by_name('staff').id
  end

  def mentor?
    self.role_id == Role.find_by_name('mentor').id
  end

  def student?
    self.role_id == Role.find_by_name('student').id
  end

  def register?
    self.role_id == Role.find_by_name('register').id
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

  def role_change_to(text)
    self.role_id = Role.find_by_name(text).id if Role::ROLES.include? text     
  end

  private

  def default_role
    User.count.zero? ? self.role_id = Role.find_by_name('admin').id : self.role_id = Role.find_by_name('register').id
  end
end
