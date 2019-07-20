class ContactsController < ApplicationController
  before_action :check_current_user
  before_action :load_object, only: [:show, :edit, :destroy, :update]

  def index
    @contacts = Contact.all
    @contacts_count = Contact.all.count
  end

  def new
    @contact = Contact.new
  end

  def show; end

  def edit; end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  def update
    @contact.update(contact_params)
    redirect_to contact_path
  end

  def create
    @contact = Contact.create(contact_params)
    redirect_to contacts_path
  end

  def contact_params
    params.require(:contact).permit(:user_id, :body, :title)
  end

  def load_object
    @contact = Contact.where(id: params[:id]).first
  end

  def check_current_user
    redirect_to root_path unless current_user
  end
end
