pdf.text "Sample Document", :size => 16, :style => :bold

  pdf.text "Book:",:style => :bold  
 pdf.text @book.title
  pdf.text "Author:",:style => :bold  
pdf.text @book.author 
pdf.text "Description:",:style => :bold 
  pdf.text @book.description
  pdf.start_new_page
