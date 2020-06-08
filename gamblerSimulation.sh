#! /bin/bash
echo "Hello Welcome to Gambler Simulation Problem";

stake=100;
bet=1;
wins=0;
losses=0;
count=0;
while [ 1 ]
do
	game=$((RANDOM%2));
	if [ $game -eq 0 ]
	then
		echo "Loss";
		stake=$((stake-bet));
		losses=$((losses+1));
		if [ $losses -eq 50 ]
		then
			echo "Gambler Reached Maximum Losses";
			break;
		fi
	else
		echo "Won";
		stake=$((stake+bet));
		wins=$((wins+1));
		if [ $wins -eq 50 ]
		then
			echo "Gambler Reached Maximum Wins";
			break;
		fi
	fi
done
