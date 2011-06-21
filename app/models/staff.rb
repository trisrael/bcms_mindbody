class Staff
	attr_accessor :id, :bio, :image_url, :first_name, :last_name, :name

	def initialize(options = {})
		options.keys.each do |key|
			#Set accessor variables when available
			send key.to_s + "=", options[key] if respond_to? key
		end		
	end

	def self.all(options = {})

		site_pp_id = options[:source_credentials]
		staff_pp_ids = options[:staff_options]

		begin 
			site_pp = SiteParameterPartial.find( site_pp_id.to_i )			 			
			staff_pp_ids = StaffParameterPartial.find_all( staff_pp_ids.to_i )
		rescue
			throw "Invalid parameter partials supplied."
		end

		opts = {}
		opts.merge site_pp.options.to_hash
		staff_pp_ids.each {|pp| opts.merge pp.to_has}
		
		resp = Mb::StaffService.new.get_staff(opts).to_hash
		arr = Array.new		
		staff = resp[:get_staff_response][:get_staff_result][:staff_members][:staff]
		staff = [staff] unless staff.is_a? Array

		staff.each do |staff_hash|
			arr << Staff.new(staff_hash)			
		end

		return arr
	end
end
