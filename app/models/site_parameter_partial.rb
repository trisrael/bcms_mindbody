class SiteParameterPartial < ParameterPartial
	validates_presence_of :site_ids, :source_name, :password
end
