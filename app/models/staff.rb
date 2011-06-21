class Staff
	attr_accessor :id, :bio, :image_url, :first_name, :last_name, :name
	require 'yaml'

	def initialize(options = {})
		options.keys.each do |key|
			#Set accessor variables when available
			send key.to_s + "=", options[key] if respond_to? key
		end		
	end

	def self.all(options = {})		
		site_pp_id = options[:source_credentials]
		staff_pp_ids = options[:staff_options]

		throw ArgumentError.new "Must supply source credentials." unless site_pp_id

		begin 
			site_pp = SiteParameterPartial.find( site_pp_id.to_i )
		rescue
			throw  ArgumentError.new "Invalid source credentials supplied."
		end

		if staff_pp_ids
			staff_pp_ids = staff_pp_ids.split(/\s*,\s*/)
			begin
				staff_pps = StaffParameterPartial.find( staff_pp_ids )
			rescue
				throw ArgumentError.new "Invalid staff options ids supplied"
			end
		end

		opts = {}

		src_creds_hash= {}
		src_creds_hash["SourceCredentials"] = site_pp.options.to_hash
		opts.merge! src_creds_hash

		staff_pps.each {|pp| opts.merge! pp.options.to_hash} if staff_pps
		
		resp = Mb::StaffService.new.get_staff(opts).to_hash

		throw resp.to_yaml
		arr = Array.new		
		staff = resp[:get_staff_response][:get_staff_result][:staff_members][:staff]
		staff = [staff] unless staff.is_a? Array

		staff.each do |staff_hash|
			arr << Staff.new(staff_hash)			
		end

		return arr
	end
end
