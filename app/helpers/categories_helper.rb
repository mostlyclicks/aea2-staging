module CategoriesHelper
	def assets_present(category)
		if category.layout == "float"
        	"span4 rightBorder"
        else
        	"span10"
        end
	end


	def category_type(category)
		if category.layout == "2col-1col" #about elec/aea - links to files
			"<div class=\"span8\">
          		#{category.excerpt.to_s.html_safe}
        	</div>
        	<div class=\"span4\">
	          	<ul id=\"assets\">

	            	<li style=\"width:100%;\">about elec/aea</li>
	            	<li style=\"width:100%;\">Month</li>
	          	</ul>
        	</div>"
		elsif category.layout == "1col-2col" #stories - links to files
			html = ""
			html << "<div class=\"span4\">
          		#{category.excerpt.to_s.html_safe}
        	</div>
        	<div class=\"span8 float-right\">
	          	<ul id=\"assets\">"
	          	if category.assets.present?
	          		category.assets.each do |ca|
	          			html << "<li class=\"float-links\">#{link_to ca.name, ca.aea_file_url, target: '_blank'}</li>"
	          		end
	          	end 
	        html << "</ul>
        	</div>"

		elsif category.layout == "1col-2col-faq" #faqs - links to unhide answers
			html = ""
			html << "<div class=\"span4\">
          		#{category.excerpt.to_s.html_safe}
        	</div>
        	<div class=\"span8\">"
        		if category.assets.present?
        			category.assets.each do |ca|
        				html << "<a href=\"##{'faq'+ca.id.to_s}\" data-toggle=\"collapse\" data-target=\"##{'faq'+ca.id.to_s}\">#{ca.faq_question}</a>"
        				html << "<div id=\"#{'faq'+ca.id.to_s}\" class=\"collapse\">#{ca.faq_answer}</div>"
        			end
        		end
        	html << "</div>"			

	    else category.layout == "1col-2col-resources" #resources - links to directories URLs
	    	html = ""
	    	html << "<div class=\"span4\">
          		#{category.excerpt.to_s.html_safe}
        	</div>
        	<div class=\"span8 float-right\">
	          	<ul id=\"assets\">"
	          	if category.assets.present?
	        		category.assets.each do |ca|
	        			html << "<li class=\"float-links\">#{link_to ca.link_display_text, ca.link_url}</li>"
	        		end
	        	end
	        html << "</ul>
        	</div>"
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
		if category.slug == 'news-releases'
			category.name
			pr = category.assets.last
			"<h5>#{pr.name}</h5>
			#{pr.excerpt}<br />
			#{link_to 'See press release', '/assets/' + pr.slug}".html_safe

		end
	end

end
