module CategoriesHelper
	def assets_present(category)
		if category.assets.present?
        	"span4"
        else
        	"span10"
        end
	end
end


#<dl>
#            <dt><%= link_to ca.name, ca %></dt>
#                <% if ca.aea_file_url.present? %>
#                <dd><%= link_to 'Download file', ca.aea_file_url %></dd>
#                <% end %>
#            </dl>