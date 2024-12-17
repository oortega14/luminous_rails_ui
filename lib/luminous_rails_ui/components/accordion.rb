require "tailwind_merge"

# LuminousRailsUi folder
module LuminousRailsUi
  # Components folder
  module Components
    # Define Button component
    class Accordion < ViewComponent::Base
      def initialize(
        items:,
        multiple_open: false,
        color: :default
      )
        super()
        @items = items
        @multiple_open = multiple_open
        @color = color
      end

      def call
        content_tag(:div, class: "w-full max-w-md mx-auto sm:max-w-lg md:max-w-xl lg:max-w-2xl") do
          @items.map.with_index do |item, index|
            render_accordion_item(item, index)
          end.join.html_safe
        end
      end

      private

      def render_accordion_item(item, index)
        content_tag(:div, class: "border-b-2 border-gray-400 rounded-md overflow-hidden") do
          concat(render_header(item, index))
          concat(render_content(item, index))
        end
      end

      def render_header(item, index)
        content_tag(:button,
                    class: "flex justify-between items-center w-full p-4 text-left bg-white hover:bg-gray-50 focus:outline-none",
                    data: {
                      accordion_header: true,
                      index: index
                    }) do
          concat(
            content_tag(:div, class: "flex-1 flex flex-col text-start") do
              content_tag(:span, item[:title], class: "text-foreground text-large")
            end
          )
          concat(
            content_tag(:span, class: "text-default-400 transition-transform") do
              concat(render_icon)
            end
          )
        end
      end

      def render_content(item, index)
        content_tag(:div,
                    class: "hidden opacity-0 max-h-0 p-4 transition-all duration-300 ease-in-out",
                    data: {
                      accordion_content: true,
                      index: index
                    }) do
          concat(item[:content])
        end
      end

      def render_icon
        render LuminousRailsUi::Icons::LeftArrowIcon.new
      end
    end
  end
end
