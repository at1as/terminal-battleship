# Terminal-Battleship

[Battleship](https://en.wikipedia.org/wiki/Battleship_(game)) game for the terminal

### Usage

```
$ git clone https://github.com/at1as/terminal-battleship.git
$ cd terminal-battleship
$ ruby play.rb
```

Run with the following environment variable to see the solution

```
cheat=true ruby play.rb
```

### Gameplay
```
   A B C D E F G H I J
   –––––––––––––––––––
1 |. . . . . . d d . .| 1
2 |. . . . . . . . . .| 2
3 |. . . . . . . . . .| 3
4 |. . . . . . . . . .| 4
5 |. . . . . . . . . .| 5
6 |. . . s C C C C C .| 6
7 |b . . s . . . . . .| 7
8 |b . . s c . . . . .| 8
9 |b . . . c . . . . .| 9
10|b . . . c . . . . .| 10
   –––––––––––––––––––
   A B C D E F G H I J
```

### Requirements

* Built on ruby 2.4.0 on macOS

### TODO

* print board showing guesses without divulging ship locations
