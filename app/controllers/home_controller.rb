# frozen_string_literal: false

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
