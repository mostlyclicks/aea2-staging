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
			html = ""
			html << "<div class=\"span8\">
          		#{category.excerpt.to_s.html_safe}
        	</div>
        	<div class=\"span4\">
	          	<ul id=\"assets\">"
	          		if category.assets.present?
	          		category.assets.each do |ca|
	          			html << "<li style=\"width:100%\">#{link_to ca.name, ca.aea_file_url, target: '_blank'}</li>"
	          		end
	          	end 
	         html << "</ul>
        	</div>"

		elsif category.layout == "1col-2col" #stories - links to files
			html = ""
			html << "<div class=\"span4\">
          		#{category.excerpt.to_s.html_safe}
        	</div>

        	<div class=\"span8\">"
        	html << "<div style=\"margin-left:30px;\"><ul id=\"assets\" style=\"margin-top:-11px;\">"
        		if category.assets.present?
        			category.assets.each do |ca|
        				if ca.asset_type != "img-for-news-release"
        				html << "<li width=\"100%\" class=\"question-links\">#{link_to ca.name, ca.aea_file_url, target: '_blank'}</li>"
        				end
        			end
        			html << "</ul></div>"
        		end
        	html << "</div>"

		elsif category.layout == "1col-2col-faq" #faqs - links to unhide answers
			html = ""
			html << "<div class=\"span4\">
          		#{category.excerpt.to_s.html_safe}
        	</div>
        	<div class=\"span8\">"
        	html << "<div style=\"margin-left:30px;\"><ul id=\"assets\" style=\"margin-top:-11px;\">"
        		if category.assets.present?
        			
        			category.assets.each do |ca|
        				if ca.asset_type == "faq-question"
        				html << "<li width=\"100%\" class=\"question-links\"><a href=\"##{'faq'+ca.id.to_s}\" data-toggle=\"collapse\" data-target=\"##{'faq'+ca.id.to_s}\">#{ca.faq_question}</a>"
        				html << "<div id=\"#{'faq'+ca.id.to_s}\" class=\"collapse c-width\" style=\"margin-bottom:0em;color:#008fc5;background-color:#e6f4f9;padding-left:4px;\">#{ca.faq_answer}</div></li>"
        				end
        			end
        			html << "</ul></div>"
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
	        			if ca.asset_type == "links"
	        				if ca.link_url == "https://aea2-assets.s3.amazonaws.com/uploads/AEA-BrandStandards-summer2012-v2.pdf"
	        					html << "<li class=\"float-links\">#{link_to ca.link_display_text, ca.link_url, target: '_blank'}</li>"
	        				else
	        					html << "<li class=\"float-links\">#{link_to ca.link_display_text, ca.link_url }</li>"
	        				end
	        			end
	        		end
	        	end
	        
	        html << "</ul>
        	</div>"
	    end
	end


	def hide_pr(category)
		if category.slug == 'news-releases'
			"hidden"
		end
	end

	def divider(category)
		if category.slug == 'news-releases' || category.slug == 'resources'
			''
		else
			'<div style="border-top:1px solid #6d6e71;margin:7px 30px -7px 50px;"></div>'
		end
	end

	def pr_category(category)
		if @current_action != 'latest_news_release'
			if category.slug == 'news-releases'
				category.name
				pr = category.assets.last
				"<h5>#{pr.name}</h5>
				#{pr.excerpt}<br /><br />
				<ul id=\"assets\" style=\"margin-left:15px;\">
				<li style=\"width:100%;margin-left:0px;\"><strong>#{link_to 'News release archive', '/assets/latest_news_release' }</strong></li>
				</ul>
				<br />
				".html_safe
			end
		else
			""
		end
	end

end
