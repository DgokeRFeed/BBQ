require "rails_helper"

RSpec.describe EventPolicy do
  let!(:events_creator) { User.new }
  let!(:user) { User.new }
  let!(:event) { Event.create(user: events_creator) }
  
  subject { EventPolicy }

  permissions :show? do
    context "when anonymous" do
      it "can't show event" do
        is_expected.not_to permit(nil, event)
      end
    end

    context "when user is owner" do
      it "can show event" do
        is_expected.to permit(events_creator, event)
      end
    end

    context "when user is not owner" do
      it "can't show event" do
        is_expected.to permit(user, event)
      end
    end
  end

  permissions :update? do
    context "when anonymous" do
      it "can't update event" do
        is_expected.not_to permit(nil, event)
      end
    end

    context "when user is owner" do
      it "update event" do
        is_expected.to permit(events_creator, event)
      end
    end

    context "when user is not owner" do
      it "can't update event" do
        is_expected.not_to permit(user, event)
      end
    end
  end

  permissions :edit? do
    context "when anonymous" do
      it "can't edit event" do
        is_expected.not_to permit(nil, event)
      end
    end

    context "when user is owner" do
      it "edit event" do
        is_expected.to permit(events_creator, event)
      end
    end

    context "when user is not owner" do
      it "can't edit event" do
        is_expected.not_to permit(user, event)
      end
    end
  end

  permissions :destroy? do
    context "when anonymous" do
      it "can't destroy event" do
        is_expected.not_to permit(nil, event)
      end
    end

    context "when user is owner" do
      it "destroy event" do
        is_expected.to permit(events_creator, event)
      end
    end

    context "when user is not owner" do
      it "can't destroy event" do
        is_expected.not_to permit(user, event)
      end
    end
  end
end