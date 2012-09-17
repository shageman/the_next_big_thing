module Teaser
  class TeaseController < Teaser::ApplicationController
    def new
    end

    def create
      email = params[:new_sign_up_entry].presence
      render text: "Hey! Please call this right... I need a new signUp entry!", status: 400 and return unless email

      similar_exisiting_entry = Teaser::Entry.find_by_email(email)
      render text: "Hm... something went wrong. Did you already sign up?", status: 400 and return if similar_exisiting_entry

      if Teaser::Entry.create(email: email)
        render text: "Thanks for signing up!", status: 200
      else
        render text: "Hm... something went seriously wrong.", status: 500
      end
    end
  end
end