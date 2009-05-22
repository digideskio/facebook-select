module FacebookHelper
  def facebook_select_tag(name, url, tags = [], options = {})
    options.symbolize_keys!
    options[:hint] ||= "Begin typing..."
    options[:id]   ||= sanitize_to_id(name).gsub(/_+$/, '')
    
    returning(String.new) do |output|
      output << text_field_tag(name, nil, :id => "#{options[:id]}_input")
      output << content_tag(:div, :id => "#{options[:id]}_auto", :target => url_for(url), :class => "facebook-auto") do
        content_tag(:div, options[:hint], :class => "default")
        content_tag(:ul, :class => "feed") do
          tags.map { |tag| content_tag(:li, tag, :value => tag) }.join
        end
      end
      output << javascript_tag("FancyInput.init('#{options[:id]}_input', '#{options[:id]}_auto')")
    end
  end
end