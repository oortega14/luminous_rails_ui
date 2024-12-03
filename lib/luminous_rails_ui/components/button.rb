require "tailwind_merge"

# LuminousRailsUi folder
module LuminousRailsUi
  # Components folder
  module Components
    # Define Button component
    class Button < ViewComponent::Base
      def initialize(
        color: :default,
        label: "Button",
        size: :md,
        loading: false,
        loading_label: 'Loading...',
        **additional_options
      )
        super()
        @label = label
        @color = color
        @size = size
        @loading = loading
        @loading_label = loading_label
        @additional_options = additional_options
      end

      def call
        merger = TailwindMerge::Merger.new
        final_classes = merger.merge(all_classes)
        content_tag(:button, button_content,
                    class: final_classes,
                    disabled: @loading || @additional_options[:disabled])
      end

      private

      def all_classes
        [base_classes,
         disabled_class,
         size_classes,
         color_classes,
         additional_classes].join(" ")
      end

      def base_classes
        "text-white rounded font-semibold transition-all duration-200 ease-in-out active:scale-95"
      end

      def disabled_class
        if @additional_options[:disabled] || @loading
          "opacity-75 cursor-not-allowed pointer-events-none"
        else
          ""
        end
      end

      def size_classes
        validated_class(LuminousRailsUi::Config::BUTTON_SIZES, @size, :md)
      end

      def color_classes
        variant = @additional_options[:variant] || :solid
        color = @color.to_sym
        custom_classes = @additional_options[:classes] || ""

        has_custom_background = custom_classes.match?(/\bbg-\S+/)

        case variant
        when :solid
          if has_custom_background
            ""
          else
            validated_class(LuminousRailsUi::Config::COLORS, color, :default)
          end
        when :ghost
          [
            "bg-transparent",
            "border-2",
            LuminousRailsUi::Config::BORDER_COLORS.fetch(color, LuminousRailsUi::Config::BORDER_COLORS[:default]),
            LuminousRailsUi::Config::TEXT_COLORS.fetch(color, LuminousRailsUi::Config::TEXT_COLORS[:default])
          ].join(" ")
        when :light
          LuminousRailsUi::Config::TEXT_COLORS.fetch(color, LuminousRailsUi::Config::TEXT_COLORS[:default])
        else
          validated_class(LuminousRailsUi::Config::COLORS, color, :default)
        end
      end

      def additional_classes
        @additional_options[:classes]
      end

      def validated_class(collection, key, default_key)
        collection.fetch(key.to_sym) do
          warn "#{key} not found in #{collection.keys}. Using #{default_key}."
          collection[default_key]
        end
      end

      def button_content
        if @loading
          spinner_content
        else
          @label
        end
      end

      def spinner_content
        content_tag(:span, class: "flex items-center justify-center gap-2") do
          concat(spinner_svg)
          concat(@loading_label)
        end
      end

      def spinner_svg
        content_tag(:span, class: "animate-spin") do
          <<-SVG.html_safe
            <svg xmlns="http://www.w3.org/2000/svg"
                 class="h-5 w-5"
                 fill="none"
                 viewBox="0 0 24 24"
                 stroke="currentColor">
              <path strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
          SVG
        end
      end
    end
  end
end
