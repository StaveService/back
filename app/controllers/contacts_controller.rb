class ContactsController < ApplicationController
  def create
    contact = Contact.new(contact_params)
    if contact.valid?
      ContactMailer.create(contact).deliver
    end
    render json: contact
  end
  
  def contact_params
    params.require(:contact).permit(:email, :description)
  end
end
