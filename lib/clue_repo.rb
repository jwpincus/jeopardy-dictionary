require_relative 'clue'
require "csv"
require 'pry'
class ClueRepository
  attr_reader :repository
  def initialize(csv_path)
    @csv = CSV.open csv_path, headers: true, header_converters: :symbol
    @repository = make_repository
  end

  def make_repository
    repository = []
    @csv.read.each do |clue|
      repository << Clue.new(clue, self)
    end
    repository
  end

  def find_all_by_question(question)
    array = repository.find_all do |clue|
      clue.question.downcase == question.downcase
    end
    array.map do |clue|
      "Category: #{clue.category}<br> Answer: #{clue.answer}<br>"
    end
  end
    
end
