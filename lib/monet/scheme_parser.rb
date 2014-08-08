module Monet

  class SchemeParser

    attr_accessor :colour
    alias_method :to_s, :colour

    ORDINALS = [ :primary, :secondary, :tertiary, :quaternary, :quinary, :senary, :septenary, :octonary, :nonary, :denary ]

    def initialize(colour_scheme: Monet::Config::colour_scheme, section: :app, reference: 0)
      @section        = colour_scheme[section] rescue Monet::UndefinedSectionError.new("Monet section doesn't exist")
      @reference      = reference
      parse!
    end

    private

    attr_reader :section, :reference

    def parse!
      @colour = case
        when reference_is_ordinal? && section_contains_index?( ordinal_to_int(reference) )
          section[ordinal_to_int(reference)]
        when (reference_is_digit? && section_contains_index?( reference.to_i - 1 ))
            section[ (reference.to_i - 1) ]
        when section_contains_key?
            section[reference.to_sym]
        else
          raise Monet::UndefinedReferenceError.new "Reference isn't a valid index, ordinal or key"
        end
    end


    def reference_is_ordinal?
      ORDINALS.include? reference
    end

    def reference_is_digit?
      /^[0-9]*$/ =~ reference.to_s
    end

    def section_contains_key?
      section.is_a?(Hash) && section.has_key?(reference.to_sym)
    end

    def section_contains_index?(index)
      !section[ index ].nil?
    end

    def ordinal_to_int ref
      ORDINALS.index ref
    end

  end

end