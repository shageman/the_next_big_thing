module EmailSignup
  class EntryManager
    def create(email)
      EmailSignup::Entry.create! email: email, tries: 0
    end

    def find_by_email(email)
      EmailSignup::Entry.find_by_email email
    end
  end
end