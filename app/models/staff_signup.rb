class StaffSignup < ActiveRecord::Base
    
    validates :email, presence: true, uniqueness: true
    validate :staff_exists?

    include Tokenable

    def staff_exists?
        return false if Staff.find_by(email: self.email).nil?
    end
end
