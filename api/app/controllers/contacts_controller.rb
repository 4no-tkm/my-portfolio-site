class ContactsController < ApplicationController
    def create
        @contact = Contact.new(contact_params)

        if @contact.save
            ContactMailer.contact_email(@contact).deliver_now
            
            render json: { message: "Thank you for your inquiry."}, status: :created
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
