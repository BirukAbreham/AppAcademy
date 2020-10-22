require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  @@table_name = ""

  def self.columns
    query = <<-SQL
      SELECT * FROM #{self.table_name}
    SQL
    x = DBConnection.execute2(query)
    # print x[0].map(&:to_sym)
    x[0].map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col.to_s}=") do |set_val|
        x = self.attributes
        x[col] = set_val
        @attributes = x
      end

      define_method(col) do
        x = self.attributes
        return x[col]
      end
    end
  end

  def self.table_name=(table_name)
    @@table_name = table_name
  end

  def self.table_name
    if @@table_name == ""
      @@table_name = (self.to_s).tableize
    end
    @@table_name
  end

  def self.all
    query = <<-SQL
      SELECT * FROM #{self.table_name}
    SQL
    results = DBConnection.execute(query)
    return self.parse_all(results)
  end

  def self.parse_all(results)
    # puts "#{results}"
    puts self.to_s
    results.map { |row| self.new(row) }
  end

  def self.find(id)
    query = <<-SQL
      SELECT * FROM #{self.table_name} WHERE id = #{id} LIMIT 1
    SQL
    result = DBConnection.execute(query)
    return nil  if result.empty?
    self.new(result)
  end

  def initialize(params = {})
    params.each do |key, v|
      if self.class.columns.include?(key.to_sym)
        self.send("#{key}=".to_sym, v)
      else
        raise "unknown attribute '#{key}'"
      end
    end
  end

  def attributes
    if @attributes.nil?
      self.instance_variable_set('@attributes', {})
      return {}
    else
      return @attributes
    end
  end

  def attribute_values
    self.class.columns.map { |key| self.send(key) }
  end

  def insert
    col_name = self.class.columns.join(',')
    question_mark = (['?']*self.class.columns.length).join(',')
    x = DBConnection.execute(<<-SQL, #{*self.attribute_values}
      INSERT #{self.table_name} (#{col_name}) VALUES (#{question_mark})
    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
