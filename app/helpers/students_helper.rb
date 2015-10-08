module StudentsHelper
		def student_error!
    return if  @student.errors.empty?
    msg = @student.errors.full_messages.map { |m| content_tag(:li, m) }.join
    html = <<-HTML
     <div class="alert alert-danger alert-dismissable">
      <ul>#{msg}</ul>
    </div>
    HTML
    html.html_safe
  end

end
