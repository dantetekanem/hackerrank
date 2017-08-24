Refactoring of `legacy_movies.rb`, this code didn't had any tests, so I've added my own.

Using flog for analysis.

Before:
```
/hackerrank/refactors (master)$ flog legacy_movies.rb
    89.9: flog total
    11.2: flog/method average

    75.0: Customer#statement               legacy_movies.rb:34-64
```

After refactoring:
```
/hackerrank/refactors (master)$ flog movies.rb
    70.0: flog total
     3.5: flog/method average

    12.4: Customer#statement               movies.rb:96-103
     6.8: RegularMovie#amount_in_days_of_rent movies.rb:25-28
     6.6: ChildrenMovie#amount_in_days_of_rent movies.rb:17-20
     6.5: Customer#frequent_renter_points  movies.rb:92-93
     6.5: Customer#total_amount            movies.rb:88-89
     4.1: RestrictedMovie#amount_in_days_of_rent movies.rb:43-46
```
