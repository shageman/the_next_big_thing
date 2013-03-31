module Teaser
  class TeaseController < Teaser::ApplicationController

    before_filter :inject_dependencies, only: [:create]

    def new
    end

    def create
      email = params[:new_sign_up_entry].presence
      render text: "Hey! Please call this right... I need a new signUp entry!", status: 400 and return unless email

      if similar_exisiting_entry = EmailSignup::Entry.find_by_email(email)
        similar_exisiting_entry.update_attribute(:tries, similar_exisiting_entry.tries + 1)
        render(
            text: @annoyance_meter.annoyance_adjusted("Hm... Did you already sign up?", similar_exisiting_entry.tries),
            status: 400) and return
      elsif EmailSignup::Entry.create(email: email, tries: 0)
        render text: "Thanks for signing up!", status: 200
      else
        render text: "Hm... something went seriously wrong.", status: 500
      end
    end

    private

    def inject_dependencies
      @annoyance_meter = Annoyance::Meter.new(20)
    end
  end
end