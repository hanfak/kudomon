# Kudomon GO!
Credit Kudos' Technical Challenge.

## Approach

I decided to tackle this program as a Ruby command line game, to be played in pry or irb (if more time would create runner with user interface to run the game).

The creation of this project was done using TDD and a 100% test coverage, using Rspec as the testing framework. I used doubles and mocks to keep unit tests focused on the class in question.

### Location of trainers and kudomons

I decided to use a 2 dimensional grid to place the actors on it. I then set each trainer's and kudomon's position as a random location on this grid (geospace). Also made sure that no two actors occupied the same space.

I chose to use whole numbers for the grid locations, this was to keep calculations simple, later on can use decimals/floats to represent exact location.

### Nearby kudomons

I decided to make the choice for the player with who they can attempt to capture. I did this by finding the shortest path(using Pythagoras' theorem) from the trainer and the kudomons, and this becomes the target to capture.

### Who gets the kudomon first

I decided to have another action (initiate capture) to prevent simultaneous captures. This was done, by the user having to initiate first, and pick the correct number to complete the initiatlising. Once initialized, the trainer could capture it while other trainers could not capture this kudomon.

## Issues

If a trainer wishes to catch another kudomon after being denied initiating capture to lock that kudomon down, it cannot choose the next closest kudomon. It must wait until the trainer captures it, or it has another chance to initiate capture after the other trainer fails to intiate capture.

I decide to avoid a trainer moving and fixed it's location. This would have solved the problems of the above issue in terms of choosing another kudomon to spot. I did this avoid more complexity at the time, and would be feature to add later on, I felt it was not necessary for an MVP.

I decided not to return a list of closest kudomon, that the player has an option to initiate capture. The player can only focus on the closest kudomon at a time. This would avoid conflicts of players going after the same kudomon.

### Simultaneous captures

To avoid issues of simultaneous captures, I decided to add the following:
  - Add an initiate capture stage, which involved locking the kudomon to the trainer, until captured.
  - Having variable tries to initiate capture, by matching a random number (later good be a game, similar to how players in the real game have to swipe up etc).
  - No two trainers can occupy the same spot, which reduced the chances of matching the same kudomon when spotting one.

Yes there are isssues with players the same distance from the same kudomon, but adding a delaying in the initate capture stage, will help prevent this, plus influence players to think they have to do something banal to get it done.

## Completed

- Part 1: Setup classes for trainers and kudomons
- Part 2: a trainer can capture a kudomon, store kudomons in an object, extracted spacial behaviours to geospace
- Part 3: multiple trainers can capture kudomons
- Part 4: Can fight other trainer's kudomons, with fixed hits

## To Do

- Part 4: Include kudomon's weakness in attacking
- User interface, instead of typing in pry or other REPLs, a program is run that guides the user instead of typing out the full commands etc
- Make it into a rails app, store the kudomons and trainers in database, visual/gui interface


## Technology

Ruby 2.2.3
Rspec
Pry
coveralls (for test coverage)
simplecov (for test report)

## Excute

1. clone repo
2. enter directory of repo
3. type `bundle install`
4. type 'rspec' to run tests

# Example of how to play

Enter pry and copy and paste the following code

```
#import files
require './lib/kudomon.rb'
require './lib/trainer.rb'
require './lib/kudomons.rb'
require './lib/geospace.rb'
require './lib/multiplayer_capture_controller.rb'
require './lib/batte_controler.rb'

#setup, can change name in trainer
space = Geospace.new
trainer_1 = Trainer.new("han", space)
trainer_2 = Trainer.new("arya", space)
kudomons = Kudomons.new

# Can add more kudomons
kudomons.add_kudomon Kudomon.new( "Sourbulb" , "grass", space, 10 , 2 )
kudomons.add_kudomon Kudomon.new( "pikabu" , "electric", space, 10 , 2  )


ctrl = MultiplayerCaptureController.new(kudomons, trainer_1, trainer_2)
battle_ctrl = BattleController.new(trainer_1,trainer_2)

#Find kudomon
ctrl.spot_kudomon(trainer_1)

# Begin capture, choose different numbers from 1 to 5
# May have to repeat several times to intiiate capture
ctrl.initiate_capture(trainer_1, 2)

# Once initiated, can capture
ctrl.capture(trainer_1)

#For player 2

ctrl.spot_kudomon(trainer_2)
ctrl.initiate_capture(trainer_2, 4)
ctrl.capture(trainer_2)

#Can repeat all the capture process until none left

#To battle, make sure two players have captured at least one kudomon each
#Choose which random kudomons to fight with
battle_ctrl.pick_kudomons

#fight as many times until winner is declared
battle_ctrl.fight
```

# The Task

## What is this challenge for?
We want to understand the way you think about problems, and how you write code to tackle them. We’re not looking for the most efficient algorithmics, we’re looking for the simplest solution. We’re not going to give much in the way of guidance as to the specifics of implementation - if you think a model needs an attribute or a method, you go ahead and do it. You’re in charge.

## How should solutions be presented?
Ideally, solutions will be Ruby code with tests. Rails is optional.
Fork this repo, and raise a pull-request containing your answer.

## So, what’s the challenge?
Imagine that all around us, in a virtual world, are virtual creatures (Kudomon) that you can catch and collect.

A Trainer (like you) can log onto their computer and be unaware that these Kudomon are all around them in geo-virtual space. Your task is to design and build an application through which one can interact with these Kudomon.

### Part 1
#### Define classes to model this application.
There are many different species of Kudomon, each having a type. Examples:

- species: Sourbulb, type: grass
- species: Mancharred, type: fire
- species: Chikapu, type: electric

Other types include water, rock and psychic. Feel free to invent your own species using these six types!

Both Trainers and Kudomon need to have a Position, so we can know which Kudomon are nearby.

### Part 2
#### Gotta catch ‘em all!
In this part we’ll implement the means for a Trainer to catch a Kudomon and add it to their collection.

First, we need to know which Kudomon are nearby to a Trainer. Write code to calculate this. How you define “nearby” is completely up to you.

A Trainer can catch nearby Kudomon and add them to his/her collection. Write code to allow this.

### Part 3
#### Multi-player
Now we’re going to introduce the idea that multiple people can try and catch Kudomon at the same time.

Scenario:
I’m sat at my computer and I see a Kudomon I want to catch. I try to catch it.
At the exact same time, my neighbour Freddy sees the same Kudomon and also tries to catch it.
Freddy succeeds and adds the Kudomon to his collection before I’ve finished catching it.
I now feel sad.

How can we avoid this situation?

Now imagine instead of just two people, it’s now 1000 people cramming into Central Park to catch the same Kudomon - would the same solution work then?

If applicable, amend your code to allow for these situations.

### Part 4
#### Be the very best!
For some reason, Kudomon allow their Trainers to make them battle each other until one of them is knocked out. Add the concept of a Battle between two Kudomon to your code. Amend your code to take into account that Kudomon have health points and combat points.

Write code for a fight with the following mechanics:

1. A randomly chosen Kudomon goes first.
2. Until one of the Kudomon is knocked out (i.e. when health points <= 0), both battling Kudomon take it in turns to inflict damage on the other. The amount of damage is equivalent to their combat points.
3. The battle should return the winner.

To make it more interesting, certain types Kudomon fight far more effectively against other types. For example, a fire Kudomon will trounce a grass type, but a water type will extinguish a fire type.

Water > Fire > Grass > Rock > Electric > Water
(Psychic is good against everything except other psychics.)

Amend your code to take this dynamic into account.
