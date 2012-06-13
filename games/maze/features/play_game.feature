Feature: Play game

  Background:
    Given a player "always-east" who moves like this:
      """
      #!/usr/bin/env ruby
      board_state = ARGV[0]
      puts "E"
      """
    And a player "always-south" who moves like this:
      """
      #!/usr/bin/env ruby
      board_state = ARGV[0]
      puts "S"
      """
    And using a map "basic":
      """
      ***********
      *1.....__.F
      *...***...*
      *2..***...*
      ***********
      """
  Scenario: Player 1 reaches finish first
    When a game is played between "always-east" and "always-south"
    Then I should see exactly:
      """
      player 1: 'always-east'
      player 2: 'always-south'
      You are player 1
      ***********
      *1.....__.F
      *...***...*
      *2..***...*
      ***********
      1 move: E
      You are player 2
      ***********
      *.1....__.F
      *...***...*
      *2..***...*
      ***********
      2 move: S
      You are player 1
      ***********
      *.1....__.F
      *...***...*
      *2..***...*
      ***********
      1 move: E
      You are player 2
      ***********
      *..1...__.F
      *...***...*
      *2..***...*
      ***********
      2 move: S
      You are player 1
      ***********
      *..1...__.F
      *...***...*
      *2..***...*
      ***********
      1 move: E
      You are player 2
      ***********
      *...1..__.F
      *...***...*
      *2..***...*
      ***********
      2 move: S
      You are player 1
      ***********
      *...1..__.F
      *...***...*
      *2..***...*
      ***********
      1 move: E
      You are player 2
      ***********
      *....1.__.F
      *...***...*
      *2..***...*
      ***********
      2 move: S
      You are player 1
      ***********
      *....1.__.F
      *...***...*
      *2..***...*
      ***********
      1 move: E
      You are player 2
      ***********
      *.....1__.F
      *...***...*
      *2..***...*
      ***********
      2 move: S
      You are player 1
      ***********
      *.....1__.F
      *...***...*
      *2..***...*
      ***********
      1 move: E
      You are player 2
      ***********
      *......__1F
      *...***...*
      *2..***...*
      ***********
      2 move: S
      You are player 1
      ***********
      *......__1F
      *...***...*
      *2..***...*
      ***********
      1 move: E
      Result: always-east wins
      """

  Scenario: Draw - max number of moves reached

  Scenario: Player 1 loses by walking in to player 2

  Scenario: Player makes an illegal move
    Given a player "mistaken" who moves like this:
      """
      #!/usr/bin/env ruby
      puts "99 flake"

      """
    When a game is played between "mistaken" and "always-east"
    Then pending

  Scenario: Player dies and throws an exception to STDERR
    Given a player "buggy" who moves like this:
      """
      #!/usr/bin/env ruby
      STDERR.puts "this is my exception"
      exit 1

      """
    When a game is played between "buggy" and "always-east"
    Then pending

  Scenario: Player takes too long to make a move
    Given the maximum seconds allowed for a move is "1.0"
    And a player "slow" who moves like this:
      """
      #!/usr/bin/env ruby
      sleep 1

      """
    When a game is played between "slow" and "always-east"
    Then pending
