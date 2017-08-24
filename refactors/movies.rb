class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def amount_in_days_of_rent(days_rented=0)
  end

  def frequent_renter_points(days_rented)
    1
  end
end

class ChildrenMovie < Movie
  def amount_in_days_of_rent(days_rented)
    amount = 1.5
    amount += (days_rented - 3) * 1.5 if days_rented > 3
    amount
  end
end

class RegularMovie < Movie
  def amount_in_days_of_rent(days_rented)
    amount = 2
    amount += (days_rented - 2) * 1.5 if days_rented > 2
    amount
  end
end

class NewReleaseMovie < Movie
  def amount_in_days_of_rent(days_rented)
    days_rented * 3
  end

  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : 1
  end
end

class RestrictedMovie < Movie
  def amount_in_days_of_rent(days_rented)
    amount = 5
    amount *= 2 if days_rented > 2
    amount
  end

  def frequent_renter_points(days_rented)
    days_rented
  end
end

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def amount
    movie.amount_in_days_of_rent(days_rented)
  end

  def frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end

  def statement
    "\t#{movie.title}\t#{amount}\n"
  end
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
    @result = ""
  end

  def add_rental(rental)
    @rentals << rental
  end

  def total_amount
    @rentals.map(&:amount).inject(:+)
  end

  def frequent_renter_points
    @rentals.map(&:frequent_renter_points).inject(:+)
  end

  def statement
    @result = "Rental Record for #{@name}\n"
    @rentals.each { |rental| @result += rental.statement }

    # add footer lines
    @result += "Amount owed is #{total_amount.to_s}\n"
    @result += "You earned #{frequent_renter_points.to_s} frequent renter points"
    @result
  end
end
