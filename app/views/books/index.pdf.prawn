pdf.text "Sample PDF"

  pdf.text "Book:",:style => :bold 
 pdf.text @books.title
  pdf.text "Author:" 
pdf.text @books.author 
pdf.text "Description:"
  pdf.text @books.description
  pdf.start_new_page
