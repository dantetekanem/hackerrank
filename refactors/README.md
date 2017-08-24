Refactoring of `legacy_movies.rb` to `movies.rb`, this code didn't had any tests, so I've added my own.

Using flog for analysis:

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
    75.5: flog total
     3.3: flog/method average

    10.1: Customer#statement               movies.rb:86-87
```

Using reek for analysis:

Before:
```
/hackerrank/refactors (master)$ reek legacy_movies.rb --config config.reek
Inspecting 1 file(s):
S

legacy_movies.rb -- 6 warnings:
  [7]:Attribute: Movie#price_code is a writable attribute [https://github.com/troessner/reek/blob/master/docs/Attribute.md]
  [44, 44, 46, 49, 49, 55]:DuplicateMethodCall: Customer#statement calls 'element.days_rented' 6 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
  [41, 55, 58]:DuplicateMethodCall: Customer#statement calls 'element.movie' 3 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
  [41, 55]:DuplicateMethodCall: Customer#statement calls 'element.movie.price_code' 2 times [https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md]
  [41, 44, 44, 46, 49, 49, 55, 55, 58]:FeatureEnvy: Customer#statement refers to 'element' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/master/docs/Feature-Envy.md]
  [34]:TooManyStatements: Customer#statement has approx 16 statements [https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md]
```

After:
```
/hackerrank/refactors (master)$ reek movies.rb --config config.reek
Inspecting 1 file(s):
.
```
