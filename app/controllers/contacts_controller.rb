class ContactsController < ApiController
  def create
    contact = Contact.new(contact_params)
    ContactMailer.create(contact).deliver if contact.valid?
    render json: contact
  end

  def contact_params
    params.require(:contact).permit(:email, :description)
  end
end
