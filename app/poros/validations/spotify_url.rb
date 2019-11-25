module Validations
  class SpotifyUrl
    def execute(value)
      return "" if value.nil?

      value['spotify']
    end
  end
end
