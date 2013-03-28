class BmailsController < ApplicationController
  # GET /bmails
  # GET /bmails.json
  @progress_count
  def index
    @bmails = Bmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bmails }
    end
  end

  # GET /bmails/1
  # GET /bmails/1.json
  def show
    @bmail = Bmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bmail }
    end
  end

  # GET /bmails/new
  # GET /bmails/new.json
  def new
    @bmail = Bmail.new

    respond_to do |format|
      format.html { render :layout => "customlayout" }
      format.json { render json: @bmail }
    end
  end

  # GET /bmails/1/edit
  def edit
    @bmail = Bmail.find(params[:id])
  end

  # POST /bmails
  # POST /bmails.json
  def create
    @bmail = Bmail.new(params[:bmail])
    @bmail.to = params[:l] 
    @bmail.cc = params[:lc]
    @bmail.body = params[:body][:body]
      if ((!params[:l].blank?) && @bmail.save)
        #redirect_to :campaigns, notice: 'Mail was successfully send.'
        #format.json { render json: @bmail, status: :created, location: @bmail }
        p "==================================="
        p params[:l]
        p @bmail.body
        p !params[:l].blank?
        p "=================================="
        p params[:l].count
        p "this is the count of emailsss123"
        p params[:l].split(",").class
        p params[:l].split(",").size
        session[:count] = params[:l].count
        session[:count_sent] = params[:l].count
        p    session[:count]
        p    session[:count_sent]
        p "is this sessions created" 
          
      params[:l].each do |single_email|
        p single_email
        Pony.mail(:to => single_email, :from => 'ankit.vyawahare@pragtech.co.in', :subject => @bmail.subject, 
      :headers => { "Content-Type" => "text/html"}, :body => @bmail.body, :via => :smtp, :via_options => { 
      :address => "smtp.gmail.com", 
      :port => 587, 
      :domain => 'pragtech.co.in', 
      :user_name => 'ankit.vyawahare@pragtech.co.in', 
      :password => 'ursoosweetankit12', 
      :authentication => 'plain', 
      :enable_starttls_auto => true 
})    
       session[:count_sent] = session[:count_sent] - 1  
      
        end
         
      else
        format.html { render action: "new" }
        format.json { render json: @bmail.errors, status: :unprocessable_entity }

      end
   render :nothing=>true
  end

  # PUT /bmails/1
  # PUT /bmails/1.json
  def update
    @bmail = Bmail.find(params[:id])

    respond_to do |format|
      if @bmail.update_attributes(params[:bmail])
        format.html { redirect_to @bmail, notice: 'Bmail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bmails/1
  # DELETE /bmails/1.json
  def destroy
    @bmail = Bmail.find(params[:id])
    @bmail.destroy

    respond_to do |format|
      format.html { redirect_to bmails_url }
      format.json { head :no_content }
    end
  end

  def bmails_check_progress_bar_status
      
       
 
        
      @count = (session[:count_sent].to_i * 100)/session[:count].to_i
      if session[:count_sent].to_i == 0
         @count = 100
      end
      @email_sent = session[:count]
     respond_to do |format|
      format.html { render :layout=>false }
      format.json { head :no_content }
      format.js { render :layout=>false }

    end
  end
end