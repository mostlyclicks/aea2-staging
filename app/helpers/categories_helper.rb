module CategoriesHelper
	def assets_present(category)
		if category.layout == "float"
        	"span4 rightBorder"
        else
        	"span10"
        end
	end

	def hide_pr(category)
		if category.slug == 'press-releases'
			"hidden"
		end
	end

	def divider(category)
		if category.slug == 'press-releases'
			''
		else
			'<div style="border-top:1px solid #cdcdcd;margin:7px 30px 7px 50px;"></div>'
		end
	end

	def pr_category(category)
		if category.slug == 'press-releases'
			category.name
			pr = category.assets.last
			pr.name
			pr.description.html_safe
		end
	end

end
