#! /bin/bash
echo "Hello Welcome to Gambler Simulation Problem";

totalWins=0;
totalLost=0; 
balance=0;
dayCount=1;
wonLost=0;
winDay=0;
lostDay=0;
trackRecord=();
gameDay()
{
	stake=100;
	bet=1;
	wins=0;
	losses=0;
	count=0;
	while [ 1 ];
	do
		game=$((RANDOM%2));
		if [ $game -eq 0 ];
		then
			# echo "Loss";
			stake=$((stake-bet));
			losses=$((losses+1));
			if [ $losses -eq 50 ];
			then
				lostDay=$((lostDay+1));
				echo "Gambler Reached Maximum Losses";
				break;
			fi
		else
			# echo "Won";
			stake=$((stake+bet));
			wins=$((wins+1));
			if [ $wins -eq 50 ]
			then
				winDay=$((winDay+1));
				echo "Gambler Reached Maximum Wins";
				break;
			fi
		fi
	done
	totalWins=$wins;
	totalLost=$losses;
	wonLost=$((100-stake));

}
while [ 1 ]
do
	if [ $dayCount -gt 30 ]; 
	then
		i=1;
		while [[ $i -le ${#trackRecord[@]} ]]; 
		do
			echo "Day #"$i" "${trackRecord[$i]};
			i=$((i+1));
		done
		echo "Total Days Won "$winDay;
		echo "Total Days lost "$lostDay;
		break;
	else
		gameDay
		trackRecord[$((dayCount))]=$wonLost;
	fi
	dayCount=$((dayCount+1));
done




