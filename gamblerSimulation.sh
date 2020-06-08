#! /bin/bash
echo "Hello Welcome to Gambler Simulation Problem";

totalWins=0;
totalLost=0; 
balance=0;
dayCount=1;
wonLost=0;
trackRecord=();

gameDay()
{
	stake=100;
	bet=1;
	wins=0;
	losses=0;
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
				echo "Gambler Reached Maximum Losses";
				break;
			fi
		else
			# echo "Won";
			stake=$((stake+bet));
			wins=$((wins+1));
			if [ $wins -eq 50 ]
			then
				echo "Gambler Reached Maximum Wins";
				break;
			fi
		fi
	done
	totalWins=$wins;
	totalLost=$losses;
	wonLost=$((100-stake));

}
gameMonth()
{
	while [ 1 ]
	do
		if [ $dayCount -gt 20 ]; 
		then
			echo "Monthly Record by Gambler";
			i=1;
			while [[ $i -le ${#trackRecord[@]} ]]; 
			do
				echo "Day #"$i" "${trackRecord[$i]};
				i=$((i+1));
			done
			# echo ${trackRecord[@]};
			break;
		else
			gameDay
			trackRecord[$((dayCount))]=$wonLost;
		fi
		dayCount=$((dayCount+1));
	done
}
while [ 1 ]
do
	gameMonth
	sorted=($(printf '%s\n' "${trackRecord[@]}"|sort));
	echo ${sorted[@]};

	read -p "Would You Like to Continue for Next Month? press 1 for YES or 0 for no " YN
	if [ $YN -eq 1 ]
	then
		gameMonth
	fi
	if [ $YN -eq 0 ]
	then
		break;
	fi
done



