# HTW Toy Robot

Simple Ruby Toy Robot for HTW.



# Instructions
- Clone: `git clone https://github.com/PuZZleDucK/HTW.git`
- Test: `rspec robot_spec.rb`
- Run `./robot.rb <input file>`


# Plan
- [x] reviw challenge and plan
- [x] setup project structure
- [x] setup tests
- [x] test & develop: place
- [x] turn
- [x] move
- [x] report
- [x] simple cli example
- [x] cli interface
- [x] invalid commands
- [ ] ci setup
- [ ] example files
- [ ] integration tests
- [ ] refactor to symbols





# Challenge Description

The Toy Robot challenge is well known coding challenge that can be solved in many different ways.

Please use Github to share your code.  We want to see how you use git to maintain code versions.

The challenge is to simulate a toy robot moving on a square board of 5 x 5 units. There are no other obstructions on the board. The robot can roam around the surface of the table but
shouldn't be able to fall off the edge. Any movement that would result in the robot falling from
the table must be prevented, however further valid movement commands must still be allowed.

The application should read the following commands:

PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT

Here is how the commands should work:
● PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH,
EAST or WEST.
● The origin (0,0) can be considered to be the SOUTH WEST most corner.
● The first valid command to the robot is a PLACE command, after that, any sequence of
commands may be issued, in any order, including another PLACE command. The
application should discard all commands in the sequence until a valid PLACE command
has been executed
● MOVE will move the toy robot one unit forward in the direction it is currently facing.
● LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without
changing the position of the robot.
● REPORT will announce the X,Y and F of the robot. This can be in any form, but standard
output is sufficient.
● A robot that is not on the table can choose to ignore the MOVE, LEFT, RIGHT and
REPORT commands.
● Input can be from a file, or from standard input, as the developer chooses.
● Provide unit tests to exercise the application.

Constraints
● The toy robot must not fall off the table during movement. This also includes the
initial placement of the toy robot.
● Any move that would cause the robot to fall must be ignored.
