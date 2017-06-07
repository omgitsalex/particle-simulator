# Particle Simulator

This code simulates falling particles according to the following rules:

Input is read from STDIN. The first line of the input is two integers (columns, rows) divided by a space. The remaining lines describe the initial state of the simulation:

	'.' is a rock
	':' is two rocks that have fallen on top of one another
	' ' is empty space into which rocks may fall
	'T' is a "table", a fixed barrier blocking rocks from falling further.

If a rock falls onto another rock, it turns into the two rock symbol.

Example input:

	7 4
	.....::
	.T    :
	  .T .:
	  .   :

Example output:

	 .    :
	 T .  :
	  .T .:
	: : .::


