# Robot Tournament

Start the server like this:

    ./bin/server

That starts the tournament engine, where you can host battles between rival teams' robots. Robots are built by programmers and have to conform to a simple protocol:

  * uploaded as zip file
  * zip file contains a single folder in the root from which the robot will take it's name
  * the folder contains an executable file, 'move' which will be called by the tournament engine when the robot needs to make a move

See the features for examples, or the folder 'examples'

Use the following command to create and start a tournament:

    ./bin/create_tournament --name "battle royale" --rounds 5 --duration 10 --game rock_paper_scissors

The idea is to practice and encourage the XP principle of 'release early, release often' by rewarding early competitors with points.

# People Who've Run This Session

* This session was first run at the [Software Craftsmanship 2010 conference.](http://sc2010subs.wordpress.com/2010/08/17/robot-tournament-matt-wynne/)
* http://blog.dalethatcher.com/2011/10/london-clojure-dojo-robot-tournament.html

If you run a session, please send a pull request with a link to a write-up.