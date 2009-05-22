module FacebookHelper
  def facebook_select_tag(name, url, tags, introtext = "begin typing")
    returning(String.new) do |output|
      output << text_field_tag(name, nil, :id => "#{name}_input")
      output << content_tag(:div, :id => "#{name}_auto", :target => url_for(url), :class => "facebook-auto") do
        content_tag(:div, introtext, :class => "default")
        content_tag(:ul, :class => "feed") do
          tags.map { |tag| content_tag(:li, tag, :value => tag) }.join
        end
      end
      output << javascript_tag("FancyInput.init('#{name}_input', '#{name}_auto')")
    end
  end
end