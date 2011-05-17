class Staff
	attr_accessor :id, :bio, :image_url, :first_name, :last_name, :name

	def initialize(options = {})
		options.keys.each do |key|
			#Set accessor variables when available
			send key.to_s + "=", options[key] if respond_to? key
		end		
	end

	def self.all(options = {})
		resp = MBStaffService.new.get_staff(options).to_hash
		arr = Array.new		
		staff = resp[:get_staff_response][:get_staff_result][:staff_members][:staff]
		staff = [staff] unless staff.is_a? Array

		staff.each do |staff_hash|
			arr << Staff.new(staff_hash)			
		end
		return arr
	end
end
