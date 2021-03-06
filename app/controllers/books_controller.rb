class BooksController < ApplicationController
  # GET /books
  # GET /books.xml
  def index
   # @books = Book.all    
     @books = Book.search(params[:search]).paginate(:per_page => 4, :page => params[:page]) 
      if current_user
        a = current_user  

        @user = current_user 
        else
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books } 
      format.pdf  { render :layout => false }  
    end
    end
  end  
       
       def calender
            @books = Book.find(:all)
           @date = params[:month] ? Date.parse(params[:month]) : Date.today  
          
         end  

  def showmybook
    @book = Book.all
        
      if current_user
         @a = current_user.id  
          @b = Book.where(:author_id => @a)
        
        @user = current_user 
        else
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books } 
      format.pdf  { render :layout => false }  
    end
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
     @book = Book.find(params[:id])   
    if current_user
    # @a = current_user.id    
     # @b = @book.author_id
      
    
      @user = current_user 
      else 
     respond_to do |format|
        
         format.html # index.html.erb
        format.xml  { render :xml => @book } 
        format.pdf { render :layout => false }  
       end
      end
  end      
  
  

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new
    @authentication = Authentication.all 
    if current_user
      
     a = current_user
     @user = User.find(a)  
   else   
     redirect_to authentications_path  
    
  end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])  
    a = current_user
     @user = User.find(a)
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(@book, :notice => 'Book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end
end
