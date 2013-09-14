# Notes
=======
>curses, a blast from the past, does all the heavy lifting.

 - Methods not intened for external consumption are marked 'private'.  This gives me confidence when refactoring.
 - Ruby's closures (lambda in this case) make the code for colorizing the players ship very clean.
 - Lots of predicate methods to make intent clear

(historical oddity: It's a common mistake that VIM was built on top of curses.  In fact parts of VIM were extracted and used for curses, because their implementation was better than the original curses code.)
