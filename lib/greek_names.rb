# coding: utf-8
require "greek_names/version"

module GreekNames
  extend self

  GRAMMARGENDER = {
    female: 1,
    male: 2,
    neutral: 3,
  }

  # returns the vocative name
  #  GreekNames.vocative("Γιώργος")
  #   => "Γιώργο"
  #  GreekNames.vocative("Αλέξανδρος")
  #   => "Αλέξανδρε"
  #  2.1.3 :001 > GreekNames.vocative("Αντώνης")
  #   => "Αντώνη"
  #  2.1.3 :002 > GreekNames.vocative("Μαρία")
  #   => "Μαρία"
  def vocative(string)
    if string[-2..-1].match(/(ας|άς)|(ης|ής)|(ΑΣ)|(ΗΣ)/)
      string.chop
    elsif string[-2..-1].match(/(ος|ός)|(ΟΣ)/)
      maleInOS(string)
    else
      string
    end
  end

  def maleInOS(string)
    case string.to_s[-4..-1]
    when /(γος|γός)|(άνος|ανος|ανός)|(τος|τός)|(ΓΟΣ)|(ΑΝΟΣ)|(ΤΟΣ)/ then string.chop
    else string[-2..-1].match(/(ΟΣ)/) ? string.gsub('ΟΣ','Ε') : string.gsub(/(ός|ος)/,'ε')
    end
  end

  def genitive(original_name, gender: )
    name = capitalize( original_name )
    if name != original_name
      raise InvalidCaseOrAccentException.new
    end

    genitive = name
    if gender == GRAMMARGENDER[:male]
      base = name[0...-2]
      ending = name[-2..-1]
      ending = case ending 
               when "ΑΣ" then "Α"
               when "ΗΣ" then "Η"
               when "ΟΣ" then "ΟΥ"
               when "ΕΣ" then "Ε"
               else ending
               end
      genitive = base + ending
    elsif gender == GRAMMARGENDER[:female]
      base = name[0...-1]
      ending = name[-1..-1]
      ending = case ending 
               when "Α" then "ΑΣ"
               when "Η" then "ΗΣ"
               when "Ο" then "ΟΥ"
               when "Υ" then "ΥΣ"
               when "Ω" then "ΟΥΣ"
               when "Σ" then "ΟΥ"
               else ending
               end
      genitive = base + ending
    elsif gender == GRAMMARGENDER[:neutral]
      raise NotImplemented.new
    else
      raise InvalidGrammarGender.new
    end
    genitive
  end

  def accusative( original_name, gender: )
    name = capitalize( original_name )
    if name != original_name
      raise InvalidCaseOrAccentException.new
    end

    accusative = name
    if gender == GRAMMARGENDER[:male]
      base = name[0...-2]
      ending = name[-2..-1]
      ending = case ending 
               when "ΑΣ" then "Α"
               when "ΗΣ" then "Η"
               when "ΟΣ" then "Ο"
               when "ΕΣ" then "Ε"
               else ending
               end
      accusative = base + ending
    elsif gender == GRAMMARGENDER[:female]
      base = name[0...-1]
      ending = name[-1..-1]
      ending = case ending 
               when "Α" then "Α"
               when "Η" then "Η"
               when "Ο" then "ΟΥ"
               when "Υ" then "Υ"
               when "Ω" then "Ω"
               when "Σ" then ""
               else ending
               end
      accusative = base + ending
    elsif gender == GRAMMARGENDER[:neutral]
      raise NotImplemented.new
    else
      raise InvalidGrammarGender.new
    end

    accusative
  end

  class InvalidCaseOrAccentException < StandardError
    def initialize(msg="Name contains lower case letters or/and letters with accent")
      super
    end
  end

  class InvalidGrammarGender < StandardError
    def initialize(msg="Invalid grammar gender. Can be GRAMMARGENDER[:male|:female|:neutral]")
      super
    end
  end

  class NotImplemented < StandardError
    def initialize(msg="Not implemented"
      super
    end
  end

  private

  def capitalize( name )
    capital = name.upcase
    capital.gsub("/Ά/", "Α").
      gsub("/Έ/", "Ε").
      gsub("/Ή/", "Η").
      gsub("/Ί/", "Ι").
      gsub("/Ό/", "Ο").
      gsub("/Ύ/", "Υ").
      gsub("/Ώ/", "Ω").
      gsub("/Ϊ/", "Ι").
      gsub("/Ϋ/", "Υ")
  end
end
