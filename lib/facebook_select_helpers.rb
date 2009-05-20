module FacebookSelectHelpers
  def facebook_select(name, url, tags)
    listitems = ""
    for tag in tags do
      listitems += "<li value=\"#{tag}\">#{tag}</li>"
    end

    string = <<END
    <input type="text" value="" id="#{name}_input" name="#{name}" />"

     <div id="#{name}_auto" target="#{url}">
       <div class="default">
        <%=t '.begin_typing' %>
      </div>
       <ul class="feed">
       #{listitems}
       </ul>
     </div>

END
    content_for :html_head do
      stylesheet_link_tag 'protomultiselect.css'
    end

    content_for :bottom_of_page do
      javascript_include_tag 'facebooklist.js'
      "<script type=\"text/javascript\">FancyInput.init('#{name}_input', '#{name}_auto');</script>"
    end
  end
end