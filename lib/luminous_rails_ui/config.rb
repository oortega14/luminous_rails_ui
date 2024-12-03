# LuminousRailsUi folder
module LuminousRailsUi
  # Define constants for the gem
  module Config
    # Definition of default colors
    COLORS = {
      default: "bg-gradient-to-br from-[#b2babb] to-[#7f8c8d] hover:from-[#99a3a4] hover:to-[#707b7c]",
      primary: "bg-gradient-to-br from-[#85c1e9] to-[#3498db] hover:from-[#5dade2] hover:to-[#2e86c1]",
      secondary: "bg-gradient-to-br from-[#bb8fce] to-[#8e44ad] hover:from-[#a569bd] hover:to-[#7d3c98]",
      success: "bg-gradient-to-br from-[#82e0aa] to-[#2ecc71] hover:from-[#58d68d] hover:to-[#28b463]",
      warning: "bg-gradient-to-br from-[#f7dc6f] to-[#f1c40f] hover:from-[#f4d03f] hover:to-[#d4ac0d]",
      danger: "bg-gradient-to-br from-[#f1948a] to-[#e74c3c] hover:from-[#ec7063] hover:to-[#cb4335]"
    }.freeze

    # Definition for Border colors
    BORDER_COLORS = {
      default: "border-[#b2babb] hover:border-[#99a3a4]",
      primary: "border-[#85c1e9] hover:border-[#5dade2]",
      secondary: "border-[#bb8fce] hover:border-[#a569bd]",
      success: "border-[#82e0aa] hover:border-[#58d68d]",
      warning: "border-[#f7dc6f] hover:border-[#f4d03f]",
      danger: "border-[#f1948a] hover:border-[#ec7063]"
    }.freeze

    # Definition for text colors
    TEXT_COLORS = {
      default: "text-[#99a3a4] hover:text-[#707b7c]",
      primary: "text-[#5dade2] hover:text-[#2e86c1]",
      secondary: "text-[#a569bd] hover:text-[#7d3c98]",
      success: "text-[#58d68d] hover:text-[#28b463]",
      warning: "text-[#f4d03f] hover:text-[#d4ac0d]",
      danger: "text-[#ec7063] hover:text-[#cb4335]"
    }.freeze

    # Definición de tamaños predeterminados
    BUTTON_SIZES = {
      sm: "px-2 py-1 text-sm",
      md: "px-4 py-2 text-base",
      lg: "px-6 py-3 text-lg"
    }.freeze
  end
end
