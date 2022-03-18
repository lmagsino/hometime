module Parsers
  class Parser

    def initialize params
      @original_params = params
      @module = self.class.to_s.demodulize.downcase.to_sym
    end

    def call
      parsed_object = {}

      ParserParameters.new(@module).params.each do |param|
        param_hash = param.first
        parsed_object[param_hash[0]] = get_value param_hash[1]
      end

      parsed_object
    end



    private

    def get_value param_keys
      value = ''
      param_keys.each do |key|

        temp_key = key
        temp_params = @original_params

        while temp_key.is_a?(Hash) && temp_params.present?
          current_key = temp_key.first[0]

          temp_key = temp_key.first[1]
          temp_params = temp_params[current_key]
        end

        value = temp_params[temp_key] if temp_params.present?
        break if value.present?
      end

      value
    end

  end
end
