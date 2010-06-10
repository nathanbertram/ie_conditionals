class IEConditionals

  module InstanceMethods
    def ie_conditionals(opts={}, &block)
      opts[:only] = [opts[:only]] if opts[:only] && !opts[:only].is_a?(Array)
      opts[:only] = opts[:only].map(&:to_i) if opts[:only]
      prefix = opts[:prefix] || 'ie'
      versions = opts[:only] || [6,7,8]
      if block_given?
        output = ''
        output += "<!--[if IE 8]><div id=\"#{prefix}8\"><![endif]-->\n" if versions.include?(8)
        output += "<!--[if IE 7]><div id=\"#{prefix}7\"><![endif]-->\n" if versions.include?(7)
        output += "<!--[if IE 6]><div id=\"#{prefix}6\"><![endif]-->\n" if versions.include?(6)
        output += capture(&block)
        output += "<!--[if IE]></div><![endif]-->" unless versions.blank?
      else
        output = ''
        output += "<!--[if IE 8]>#{stylesheet_link_tag("#{prefix}8")}<![endif]-->\n" if versions.include?(8)
        output += "<!--[if IE 7]>#{stylesheet_link_tag("#{prefix}7")}<![endif]-->\n" if versions.include?(7)
        output += "<!--[if IE 6]>#{stylesheet_link_tag("#{prefix}6")}<![endif]-->\n" if versions.include?(6)
      end
    end
  end
  
end