module Validations
  class Image
    def execute(value)
      return "" if value[0].nil?

      value[0]['url']
    end
  end
end
