class Role < ApplicationRecord
  ROLES = ['admin', 'subadmin', 'staff', 'mentor', 'student', 'register']

  validates :name, presence: true, uniqueness: true

  has_many :users

  class << self
    ROLES.each do |role|
      define_method("#{role}") do
        self.find_by_name(role)
      end
    end
  end

  scope :except_admin, -> { where.not(name: 'admin') }
  scope :except_subadmin, -> { where.not(name: 'subadmin') }
  scope :except_staff, -> { where.not(name: 'staff') }
  scope :except_mentor, -> { where.not(name: 'mentor') }
  scope :except_student, -> { where.not(name: 'student') }

  ROLES.each do |role|
    define_method("#{role}?") do
      name == "#{role}"
    end
  end

end
