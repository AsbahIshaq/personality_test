class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
    @invitations = Invitation.all
  end

  def create
    @invitation = Invitation.new(params[:email])
   
    if @invitation.save
      InvitationMailer.with(invitation: @invitation).invite_by_email(params[:email]).deliver_now
      flash[:success] = "Thank you for your order! We'll get contact you soon!"
      redirect_to invitations_path
    else
      render 'new'
    end
  end
end