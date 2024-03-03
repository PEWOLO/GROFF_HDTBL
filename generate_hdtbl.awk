#!/usr/bin/gawk -f

function Theader(){
	print ".KS"
	print ".TBL width='10% 25% 10% 20% 20% 15%'"
}

function Tfooter(){
		printf(".ETB\n.KE\n")	
}

function generateTable(){
	COUNTER=0
	TCOUNTER=1
	ROWCOUNT=45
	
	
	while (getline line < FILENAME){

		if(TCOUNTER==ROWCOUNT){
			Tfooter();
			# break
			TCOUNTER=1
		}
		if(TCOUNTER == 1){Theader()}

		if(COUNTER % 2 == 0){BGC="white"}else{BGC="grey95"}
		if(COUNTER > 0 ){
			split(line,HASH,FS);
			printf(".TR bgc=%s \".TD hal=c\" %04d .TD %s %s \".TD hal=c\" %d .TD %s .TD %s \".TD hal=c\" %s\n",
			BGC,
			COUNTER,
			HASH[1],
			HASH[2],
			HASH[4],
			HASH[5],
			HASH[6],
			HASH[7])
		
		
		}
		COUNTER++
		TCOUNTER++
	}	
}



BEGINFILE{
	FS=","	
	generateTable()
}

END{
	if(TCOUNTER < ROWCOUNT){Tfooter()}
}
