@book.each do |book|
  pdf.text "Book: #{book.title}"
  pdf.text "Author: #{book.author}"
  pdf.text book.description
  pdf.start_new_page
end