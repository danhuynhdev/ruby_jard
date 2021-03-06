# frozen_string_literal: true

module RubyJard
  module Commands
    # Command used to explore stacktrace.
    class FrameCommand < BaseCommand
      include RubyJard::Commands::ValidationHelpers

      group 'RubyJard'
      description 'Explore to any frame of current stacktrace.'
      match 'frame'
      help_doc './frame_command.doc.txt'

      def initialize(context = {})
        super(context)
        @session = context[:session] || RubyJard::Session.instance
      end

      def process
        frame = validate_present!(args.first)
        frame = validate_non_negative_integer!(frame)
        frame = validate_range!(frame, 0, @session.current_backtrace.map(&:virtual_pos).compact.max)
        RubyJard::ControlFlow.dispatch(:frame, frame: frame)
      end
    end
  end
end

RubyJard::PryProxy::Commands.add_command(RubyJard::Commands::FrameCommand)
