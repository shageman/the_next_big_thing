module Teaser
  class TeaseController < Teaser::ApplicationController

    before_filter :inject_dependencies, only: [:create]

    def new
    end

    def create
      email = params[:new_sign_up_entry].presence
      render text: "Hey! Please call this right... I need a new signUp entry!", status: 400 and return unless email

      if similar_exisiting_entry = @entry_manager.find_by_email(email)
        tries = @event_counter.log("email_signup_entry_#{similar_exisiting_entry.id}", "signup")
        render(
            text: @annoyance_meter.annoyance_adjusted("Hm... Did you already sign up?", tries),
            status: 400) and return
      elsif @entry_manager.create(email)
        render text: "Thanks for signing up!", status: 200
      else
        render text: "Hm... something went seriously wrong.", status: 500
      end
    end

    private

    def inject_dependencies
      @entry_manager = EmailSignup::EntryManager.new
      @annoyance_meter = Annoyance::Meter.new(10)
      @event_counter = EventCounter::Logger.new
    end
  end
end