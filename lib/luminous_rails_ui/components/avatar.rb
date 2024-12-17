require "tailwind_merge"

# LuminousRailsUi folder
module LuminousRailsUi
  # Components folder
  module Components
    # Define Button component
    class Avatar < ViewComponent::Base
      SIZES = {
        xs: "w-6 h-6 text-xs",
        sm: "w-8 h-8 text-sm",
        md: "w-10 h-10 text-base",
        lg: "w-12 h-12 text-lg",
        xl: "w-16 h-16 text-xl"
      }.freeze

      SHAPES = {
        circle: "rounded-full",
        square: "rounded-md"
      }.freeze

      def initialize(
        src: nil,
        alt: "Avatar",
        size: :md,
        shape: :circle,
        status: nil,
        initials: nil,
        fallback_color: "bg-gray-500"
      )
        super()
        @src = src
        @alt = alt
        @size = size
        @shape = shape
        @status = status
        @initials = initials
        @fallback_color = fallback_color
      end

      def call
        content_tag(:div, class: "relative inline-block") do
          concat(render_avatar)
          concat(render_status) if @status
        end
      end

      private

      def render_avatar
        # Ensure background color and centering for initials
        merger = TailwindMerge::Merger.new
        classes = merger.merge(["inline-flex items-center justify-center #{SIZES[@size]} #{SHAPES[@shape]} #{@fallback_color}",
                                "text-white font-bold"])

        if @src
          image_tag(@src, alt: @alt, class: classes)
        elsif @initials
          content_tag(:div, @initials, class: classes)
        else
          content_tag(:div, "", class: classes)
        end
      end

      def render_status
        status_classes = {
          online: "bg-green-500",
          offline: "bg-gray-500",
          away: "bg-yellow-500",
          busy: "bg-red-500"
        }

        content_tag(:span,
                    class: "absolute bottom-0 right-0 block #{status_classes[@status]} border-2 border-white rounded-full",
                    style: "width: 25%; height: 25%;")
      end
    end
  end
end
