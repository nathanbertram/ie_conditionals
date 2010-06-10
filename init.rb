# IE Conditionals
require File.expand_path(File.join(File.dirname(__FILE__), '/lib/ie_conditionals.rb'))

ActionView::Base.send(:include, IEConditionals::InstanceMethods)