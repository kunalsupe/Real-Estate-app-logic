pdf.text "Sample PDF"

  pdf.text "Document:",:style => :bold 
 pdf.text @properties.title
  pdf.text "Author:" 
pdf.text @properties.author 
pdf.text "Description:"
  pdf.text @properties.description
  pdf.start_new_page
