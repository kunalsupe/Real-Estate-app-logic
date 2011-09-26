pdf.text "Sample Document", :size => 16, :style => :bold

  pdf.text "Document",:style => :bold  
 pdf.text @property.title
  pdf.text "Author:",:style => :bold  
pdf.text @property.author 
pdf.text "Description:",:style => :bold 
  pdf.text @property.description
  pdf.start_new_page
