#! /bin/bash
echo "Hello Welcome to Gambler Simulation Problem";

stake=100;
bet=1;
game=$((RANDOM%2));
if [ $game -eq 0 ]
then
	echo "Loss $1";
	stake=$((stake-bet));
else
	echo "Won $1";
	stake=$((stake+bet));
fi
echo "Balance = "$stake;