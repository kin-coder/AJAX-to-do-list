class EmailsController < ApplicationController
  def index

    @email = Email.all
  end


  def create

    @email = Email.create(object:Faker::Internet.free_email,body:Faker::Movie.quote)


          if @email.save

            respond_to do |format|
            format.html {redirect_to root_path}

            flash[:notice] = "Mail created"
            format.js { }
          end

          else

            respond_to do |format|
            format.html {redirect_to root_path}
            flash[:notice] = "Please try again"
            end

            format.js { }

          end
    end



    def show


        @email = Email.find(params[:id])

        respond_to do |format|
        format.html {redirect_to root_path}
        flash[:notice] = "SHOwing..."
        format.js { }
        end

    end


    def destroy

      @email = Email.find(params[:id])
      @email.destroy

      respond_to do |format|

          format.html {

      redirect_to root_path
      flash[:notice] = "Email DELETED"}
      format.js { }
      end

    end






end
