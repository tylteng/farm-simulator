require_relative 'field.rb'

class Farm
attr_accessor :fields, :total_harvest

  def initialize
    @fields = []
    @total_harvest = 0
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.chomp
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts 'field -> adds a new field'
    puts 'harvest -> harvest crops and adds to total harvested'
    puts 'status -> displays information about your farm'
    puts 'relax -> take a nice break'
    puts 'exit -> exits the program'
  end
  #
  def call_option(user_selected)
    case user_selected
    when 'field' then add_field
    when 'harvest' then harvest
    when 'status' then status
    when 'relax' then relax
    when 'exit' then exit
    end
  end

  def add_field
    puts '(Corn, Wheat)'
    type = gets.chomp
    puts 'Size? (Hectacre)'
    size = gets.chomp.to_i
    new_field = Field.new(type, size)
    @fields << new_field
    puts 'You work hard and add a field ..'
  end

  def harvest
    @fields.each do |x|
      if x.type == 'Wheat'
        z = x.size * 30
        @total_harvest += z
      elsif x.type == 'Corn'
        z = x.size * 20
        @total_harvest += z
      end
    end
    puts 'You harvest your fields ..'
  end

  def status
    puts "The farm has #{@total_harvest} harvested food so far."
  end

  def relax
    puts "You sit back in your chair and peer over the horizon. You feel like you gained insight on human nature."
  end

end

tyler = Farm.new
tyler.main_menu
