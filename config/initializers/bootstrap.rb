# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }

# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.
# Rails.backtrace_cleaner.remove_silencers!

require 'nokogiri'

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = %(<div class="field_with_errors">#{html_tag}</div>).html_safe

  form_fields = [
      'textarea',
      'input',
      'select'
  ]

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css("label, " + form_fields.join(', '))

  elements.each do |e|
    if e.node_name.eql? 'label'
      # wrap erroneous label
      html = %(<span class='field_with_errors'>#{e}</span>).html_safe
    elsif form_fields.include? e.node_name
      # wrap erroneous field
      if instance.error_message.kind_of?(Array)
        html = %(<span class='field_with_errors'>#{e}<span class="help-inline">&nbsp;#{instance.error_message.join(',')}</span></span>).html_safe
      else
        html = %(<span class='field_with_errors'>#{e}<span class="help-inline">&nbsp;#{instance.error_message}</span></span>).html_safe
      end
    end
  end
  html
end