class EmailsController < ApplicationController
	def index
		@emails = Email.all
	end	
	def show
		@emails = Email.all
		@email = Email.find(params[:id])

	  respond_to do |format|
      format.html {redirect_to root_path}
      flash[:notice] = "show" 
      format.js { }
      end

	end	
	def create
     @email = Email.create(object:Faker::Internet.email,
		                   body:Faker::Quote.yoda)
	 if @email.save
       respond_to do |format|
      format.html { redirect_to root_path}
      flash[:notice] = "email created" 
      format.js { }
      end  
     else
      respond_to do |format|
      format.html {redirect_to root_path}
      flash[:notice] = "Please try again"
      format.js { }
      end 
     end
	end	
 def update
   @email = Email.find(params[:id])
    if (@email.read == true || @email.read == nil)
      @email.read = false
      @email.save
    else
      @email.read = true
      @email.save
    end
      respond_to do |format|
       format.html{}
       format.js{}
        end
      end


      def destroy
      @email = Email.find(params[:id])
      @email.destroy
      respond_to do |format|
      format.html {redirect_to root_path}
      flash[:notice] = "deleted"
      format.js { }
    end 
  end


end
