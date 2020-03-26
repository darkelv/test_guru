class BadgesController < ApplicationController

  def index
    received_badges = current_user.badges
    badges = Badge.all
    render locals: { received_badges: received_badges, badges: badges }
  end
end
