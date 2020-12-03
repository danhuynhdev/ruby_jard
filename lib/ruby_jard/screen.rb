# frozen_string_literal: true

module RubyJard
  ##
  # A screen is a unit of information drawing on the terminal. Each screen is
  # generated based on input layout specifiation, screen data, and top-left
  # corner cordination.
  class Screen
    attr_accessor :layout, :rows, :window, :cursor, :selected

    def initialize(layout:, session: nil, config: nil)
      @layout = layout
      @session = session || RubyJard::Session.instance
      @config = config || RubyJard.config
      @window = []
      @cursor = nil
      @selected = 0
      @rows = []
    end

    def move_down; end

    def move_up; end

    def page_up; end

    def page_down; end

    def click(relative_x, relative_y); end

    def build
      raise NotImplementedError, "#{self.class} should implement this method."
    end
  end
end
