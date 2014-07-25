My implementation of the **GREED** game, for extra credit in **Ruby Koans**.

My aim is to make my implementation follow Sandi Metz's examples and adhere to the guidelines laid out in *Practical Object Oriented Design in Ruby.*

I will consider this approach to design successfully implemented if the classes are **as decoupled as possible** from each other.

The `Game`, `Player` and `Die` objects are 'dumb': they know only as much as necessary about each other, and ideally, are modular enough to be re-used in other games - or at least, other dice games.

The logic pertaining to how GREED is played should live in the `ScoreCalculator` class (which is adapted from my solution to the 'Scoring Project' Koan), and in the `Turn` class.

I also make every effort to write my tests before writing the code, but though at times I feel a train of thought needs to be captured before it is forgotten, and the test was written afterwards.

I found it useful to create a flowchart of a turn in Greed:

![alt tag](http://i.imgur.com/I9NIEFm.png)