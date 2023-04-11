require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    correct_name = @nameable.correct_name
    correct_name = correct_name.slice(0, 10) if correct_name.length > 10
    correct_name
  end
end
