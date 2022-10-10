require "rails_helper"

RSpec.describe EventPolicy do
  let!(:events_creator) { User.new }
  let!(:user) { User.new }

  let!(:event) { Event.create(user: events_creator) }
  let!(:event_with_pincode) { Event.create(user: events_creator, pincode: "1234") }

  let!(:user_with_correct_pin) { UserContext.new(user, "1234", {}) }
  let!(:user_with_wrong_pin) { UserContext.new(user, "4321", {}) }
  let!(:creator_with_wrong_pin) { UserContext.new(events_creator, "4321", {}) }

  subject { EventPolicy }

  permissions :show? do
    context "when event have pincode" do
      context "and user is owner" do
        it "can show event" do
          is_expected.to permit(creator_with_wrong_pin, event_with_pincode)
        end
      end

      context "and user is not owner" do
        context "enter correct pincode" do
          it "can show event" do
            is_expected.to permit(user_with_correct_pin, event_with_pincode)
          end
        end

        context "enter wrong pincode" do
          it "can't show event" do
            is_expected.not_to permit(user_with_wrong_pin, event_with_pincode)
          end
        end

      end
    end

    context "when event haven't pincode" do
      context "and user is owner" do
        it "can show event" do
          is_expected.to permit(creator_with_wrong_pin, event)
        end
      end

      context "and user is not owner" do
        it "can show event" do
          is_expected.to permit(user_with_wrong_pin, event)
        end
      end
    end
  end

  permissions :update? do
    context "when user is owner" do
      it "update event" do
        is_expected.to permit(creator_with_wrong_pin, event)
      end
    end

    context "when user is not owner" do
      it "can't update event" do
        is_expected.not_to permit(user_with_wrong_pin, event)
      end
    end
  end

  permissions :edit? do
    context "when user is owner" do
      it "edit event" do
        is_expected.to permit(creator_with_wrong_pin, event)
      end
    end

    context "when user is not owner" do
      it "can't edit event" do
        is_expected.not_to permit(user_with_wrong_pin, event)
      end
    end
  end

  permissions :destroy? do
    context "when user is owner" do
      it "destroy event" do
        is_expected.to permit(creator_with_wrong_pin, event)
      end
    end

    context "when user is not owner" do
      it "can't destroy event" do
        is_expected.not_to permit(user_with_wrong_pin, event)
      end
    end
  end
end
