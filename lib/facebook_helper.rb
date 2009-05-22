module FacebookHelper
  def facebook_select_tag(name, url, tags, introtext = "begin typing")
    listitems = ""
    for tag in tags do
      listitems += "<li value=\"#{tag}\">#{tag}</li>"
    end

    return <<-END
    <input type="text" value="" id="#{name}_input" name="#{name}" />

     <div id="#{name}_auto" target="#{url}" class="facebook-auto">
       <div class="default">
        #{introtext}
      </div>
       <ul class="feed">
       #{listitems}
       </ul>
     </div>
     <script type=\"text/javascript\">FancyInput.init('#{name}_input', '#{name}_auto');</script>
    END
  end
end