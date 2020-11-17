require 'cgi'

def content_transfer(input_string, file_name = 'index', bypass_html = false)
  file = File.new("./#{file_name}.html", 'w:UTF-8')
  file.print("<!DOCTYPE html>\n\r")
  file.print("<html lang='en'>\n\r")
  file.print("<head>\n\r")
  file.print("<meta charset='utf-8'>\n\r")
  file.print("<title>title</title>\n\r")
  file.print("<link rel='stylesheet' href='style.css'>\n\r")
  file.print("<script src='script.js'></script>\n\r")
  file.print('<script>setInterval(()=>{window.location.reload()}, 5000)</script>')
  file.print("</head>\n\r")
  file.print("<body>\n\r")
  bypass_html ? (revision = input_string) : (revision = CGI::escapeHTML(input_string))
  file.print("#{revision}\n\r")
  file.print("</body>\n\r")
  file.print("</html>\n\r")
  file.close
end

# content_transfer("<script>alert('you are hacked');</script>", "js", true)
