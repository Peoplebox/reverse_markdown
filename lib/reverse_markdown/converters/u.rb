# frozen_string_literal: true

module ReverseMarkdown
  module Converters
    class U < Base
      def convert(node, state = {})
        content = treat_children(node, state.merge(already_underlined: true))
        if content.strip.empty? || state[:already_underlined]
          content
        else
          "<ins>#{content}</ins>"
        end
      end
    end

    register :u, U.new
    register :ins, U.new
  end
end
