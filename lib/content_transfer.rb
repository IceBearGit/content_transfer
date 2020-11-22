require 'cgi'
require "erb"


  def content_transfer(input_string, file_name = 'index', bypass_html = false)
    revision = bypass_html ? input_string : CGI::escapeHTML(input_string)
    out_file = File.expand_path("#{file_name}.html")
    temp_form = %(<!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Content_transfer</title>
    <link rel="stylesheet" href="style.css">
    <script src='script.js'></script>
    <script>setInterval(()=>{window.location.reload()}, 2000)</script>
  </head>
  <body>
    <%= @revision %>
  </body>
  </html>
  )
    @revision = revision
    renderer = ERB.new(temp_form)
    result = renderer.result(binding)
    File.open(out_file, "w") do |file|  
      file.write(result)
    end
 end



# content_transfer("<script>alert('you are hacked');</script>", "js", true)
