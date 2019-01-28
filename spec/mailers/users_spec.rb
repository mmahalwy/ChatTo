require "rails_helper"

RSpec.describe UsersMailer, type: :mailer do
  describe "approved" do
    let(:mail) { UsersMailer.approved }

    it "renders the headers" do
      expect(mail.subject).to eq("Approved")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
