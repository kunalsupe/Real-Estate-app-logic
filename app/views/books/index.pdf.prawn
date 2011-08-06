pdf.font "Helvetica"
pdf.font.size = 13

@books.each do |book|
  pdf.text "Book: #{book.title}", :size => 16, :style => :bold, :spacing => 4
  pdf.text "Author: #{book.author}", :spacing => 16
  pdf.text book.description
  pdf.start_new_page
end