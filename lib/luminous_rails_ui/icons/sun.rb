# LuminousRailsUi folder
module LuminousRailsUi
  # Icons folder
  module Icons
    # Define Left-arrow Icon
    class SunIcon < ViewComponent::Base
      def call
        content_tag(:svg,
                    class: "w-5 h-5 transform transition-transform duration-500",
                    data: { accordion_icon: true },
                    xmlns: "http://www.w3.org/2000/svg",
                    fill: "none",
                    viewBox: "0 0 24 24",
                    stroke: "currentColor") do
          content_tag(:path, nil,
                      stroke_linecap: "round",
                      stroke_linejoin: "round",
                      stroke_width: "2",
                      d: "M3 12h4l3 8l4 -16l3 8h4")
        end
      end
    end
  end
end
