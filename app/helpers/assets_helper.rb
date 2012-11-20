module AssetsHelper

	def pr_category(category)
		if category.slug == 'news-releases'
			category.name
			pr = category.assets.last
			"<h5>#{pr.name}</h5>
			<small>#{pr.created_at.strftime('%B, %e %Y')}</small><br />
			#{pr.excerpt}<br /><br />
			#{link_to 'See press release', '/assets/' + pr.slug}<br />
			".html_safe


		end
	end

	def toggle_new_edit_links
		if action_name == 'new'
  		  "<p>#{link_to 'Back', assets_path}</p>".html_safe
		elsif action_name == 'edit'
		  "<p>#{link_to 'Show', @asset} |
		  		   #{link_to 'Back', assets_path}</p>".html_safe
		end
	end
end
