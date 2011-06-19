class StaffParameterPartial < ParameterPartial	
	
	#Virtual attrs	

	def staff_options
		self.options = Mb::StaffOptions.new unless self.options
		self.options
	end	

	def filters=(hash = {})
		arr = []
		hash.each do |key, val|
			arr << key if val 
		end 
		staff_options.filters = arr
	end
	
	def staff_ids=(str_of_ids = "")
		str_of_ids = str_of_ids.split(/\s*,\s/)
		ids = []
		str_of_ids.each {|id| ids << id.to_i}
		staff_options.staff_ids = ids
	end

	#Getters
	def filters
		staff_options.filters
	end
	
	def staff_ids
		staff_options.staff_ids
	end

end
