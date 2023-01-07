# Evolutionary games and spatial chaos: practical usage of prisoner's dilemma
This script is a simulation of Martin A. Nowak and Robert M. May paper about "Evolutionary Games and Spatial Chaos" 1992. It is created by P. Gidlevsky using R language.

# 1.1 Description
There I explore the consequences of placing players in a two-dimensional spatial array: in each round, every individual "plays the game" with the immediate neighbours; after this, each site is occupied either by its original owner or by one of the neighbours, depending on who scores the highest total in that round; and so to the next round of the game.

If the starting configurations are sufficiently symmetrical, these ever-changing sequences of spatial patterns — dynamic fractals — can be extraordinarily beautiful, and have interesting mathematical properties. 
# 1.2 The prisoner's dilemma game
In its standard form, the Prisoners' Dilemma is a game played by two players, each of whom may choose either to cooperate, C, or defect, D, in any one encounter. If both players choose C, both get a pay-off of magnitude R; if one defects while the other cooperates, D gets the game’s biggest pay-off, T, while C gets S; if both defect, both get P. With T> R> P> S, the paradox is evident. In any one round, the strategy D is unbeatable (being better than C whether the opponent chooses C or D). But by playing D in a sequence of encounters, both players end up scoring less than they would by cooperating (because R > P). 

Interesting results emerge when we place these ‘players’ — who may be individuals or organized groups on a two-dimensional, n x n square lattice of "patches": each lattice-site is thus occupied either by a C or a D. 
# 1.3 Results
The illustrations are for the case when the game is played with the eight neighbouring sites (the cells corresponding to the chess king’s move), and with one’s own site (which is reasonable if the players are thought of as organized groups occupying territory).

The colour coding is as follows: blue represents a C site that was C in the preceding generation; red, a D site following a D: yellow, D following a C; and green, C following a D. 

This simulation is started with a single D at the centre of a 99 x 99 square-lattice world of C with fixed boundary conditions. Again 1.8 < b < 2. This generates an (almost) infinite sequence of different patterns.

Please wait while the GIFs are loading.

<img Align="center" height="" width="" src="https://github.com/Gids-Github/images/blob/main/75es74.gif" alt="">
<img height="" width="" src="https://github.com/Gids-Github/images/blob/main/75esdo.gif" alt="">
