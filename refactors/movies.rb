class Movie
  attr_reader :title, :days_rented

  def initialize(title, days_rented)
    @title = title
    @days_rented = days_rented
  end

  def amount
    0
  end

  def frequent_renter_points
    1
  end

  def statement
    "\t#{title}\t#{amount}\n"
  end
end

class ChildrenMovie < Movie
  def amount
    1.5 + days_rented_amount
  end

  def days_rented_amount
    days_rented > 3 ? (days_rented - 3) * 1.5 : 0
  end
end

class RegularMovie < Movie
  def amount
    2 + days_rented_amount
  end

  def days_rented_amount
    days_rented > 2 ? (days_rented - 2) * 1.5 : 0
  end
end

class NewReleaseMovie < Movie
  def amount
    days_rented * 3
  end

  def frequent_renter_points
    days_rented > 1 ? 2 : 1
  end
end

class RestrictedMovie < Movie
  def amount
    5 * days_rented_amount
  end

  def days_rented_amount
    days_rented > 2 ? 2 : 1
  end

  def frequent_renter_points
    days_rented
  end
end

class Customer
  attr_reader :name, :movies

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    movies << movie
  end

  def total_amount
    movies.reduce(0) { |prev, movie| prev + movie.amount }
  end

  def total_frequent_renter_points
    movies.reduce(0) { |prev, movie| prev + movie.frequent_renter_points }
  end

  def statement
    statement_title + movies_statements + statement_amount_owned + statement_earned_points
  end

  def statement_title
    "Movies Record for #{name}\n"
  end

  def statement_amount_owned
    "Amount owed is #{total_amount}\n"
  end

  def statement_earned_points
    "You earned #{total_frequent_renter_points} frequent renter points"
  end

  def movies_statements
    movies.map(&:statement).join
  end
end
