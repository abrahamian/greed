# GREED

### My implementation of the *Greed* dice game, for extra credit in *[Ruby Koans](https://github.com/neo/ruby_koans)*.

This game is played in the Terminal, and is initialized from inside the repository by running:

` ruby lib/run_game.rb`

The aim in this implementation was to follow [Sandi Metz](https://github.com/skmetz "Sandi Metz's GitHub")'s examples and guidelines (laid out in her excellent book, *[Practical Object Oriented Design in Ruby](http://www.poodr.com/)*), as closely as possible.

A guiding principle of Object Oriented Design is that a program made up of objects, which are **as decoupled from each other as possible** costs less to change.

With this in mind, the game of Greed is broken down into many classes, all of which are designed to know only as much as necessary about each other:

* the `Die`, `Player`, `Turn` and `Game` classes, should, ideally, be re-useable in other games (or at least other dice games); 
* the `TurnOfGreed` and `GameOfGreed` classes, inheriting from `Turn` and `Game`,respectively, bring Greed-specific rules to the program while honoring their super-classes' interfaces; 
* the `ScoreCalculator` class encapsulates Greed-specific methods to which dice do or don't score points, and how much a hand is worth; 
* the `GreedUI` object contains all prompts to the user, printed into the terminal. 

The tests, too, take a Sandi Metz-inspired approach in their minimalism - 
only incoming query and command messages are tested using assertions about what they 
return; outgoing command messages are tested by asserting that they are received; private methods are not tested - and their modularity (using mocks where appropriate to write loosely coupled tests).

I found it useful to create a **flowchart** of how a turn unfolds in a game of Greed:

![alt tag](http://i.imgur.com/I9NIEFm.png)

The game's rules, [as set out in **Ruby Koans**](https://github.com/neo/ruby_koans/blob/master/src/GREED_RULES.txt) :

	= Playing Greed
	
	Greed is a dice game played among 2 or more players, using 5
	six-sided dice.
	
	== Playing Greed
	
	Each player takes a turn consisting of one or more rolls of the dice.
	On the first roll of the game, a player rolls all five dice which are
	scored according to the following:
	
	  Three 1's => 1000 points
	  Three 6's =>  600 points
	  Three 5's =>  500 points
	  Three 4's =>  400 points
	  Three 3's =>  300 points
	  Three 2's =>  200 points
	  One   1   =>  100 points
	  One   5   =>   50 points
	
	A single die can only be counted once in each roll.  For example,
	a "5" can only count as part of a triplet (contributing to the 500
	points) or as a single 50 points, but not both in the same roll.
	
	Example Scoring
	
	   Throw       Score
	   ---------   ------------------
	   5 1 3 4 1   50 + 2 * 100 = 250
	   1 1 1 3 1   1000 + 100 = 1100
	   2 4 4 5 4   400 + 50 = 450
	
	The dice not contributing to the score are called the non-scoring
	dice.  "3" and "4" are non-scoring dice in the first example.  "3" is
	a non-scoring die in the second, and "2" is a non-score die in the
	final example.
	
	After a player rolls and the score is calculated, the scoring dice are
	removed and the player has the option of rolling again using only the
	non-scoring dice. If all of the thrown dice are scoring, then the
	player may roll all 5 dice in the next roll.
	
	The player may continue to roll as long as each roll scores points. If
	a roll has zero points, then the player loses not only their turn, but
	also accumulated score for that turn. If a player decides to stop
	rolling before rolling a zero-point roll, then the accumulated points
	for the turn is added to his total score.
	
	== Getting "In The Game"
	
	Before a player is allowed to accumulate points, they must get at
	least 300 points in a single turn. Once they have achieved 300 points
	in a single turn, the points earned in that turn and each following
	turn will be counted toward their total score.
	
	== End Game
	
	Once a player reaches 3000 (or more) points, the game enters the final
	round where each of the other players gets one more turn. The winner
	is the player with the highest score after the final round.
	
	== References
	
	Greed is described on Wikipedia at
	http://en.wikipedia.org/wiki/Greed_(dice_game), however the rules are
	a bit different from the rules given here.