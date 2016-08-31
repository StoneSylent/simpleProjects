memoryValue = 0; // Contains value that is stored in memory from MS
leftArgument = 0; // Stores value of left hand side value when operation button is pressed.
prevOperation=""; // Stores the previous operation
clear = true; // Boolean to determine if clear was the last button hit
check = true;
equal = false; // Boolean to determine if equal was the last button hit
clearFirstNoOp = true;
periodUsed = false;


/*----numbers----*/
function numClickHandler() {
	if (clear) { // clear was the last button hit
		document.getElementById("output").innerHTML = this.innerHTML;
		clear = false;	
	} 
	else if (document.getElementById("output").innerHTML == "0") { // value was found to be 0 after equation
		document.getElementById("output").innerHTML = this.innerHTML;
	}	
	else { /*concatenation*/
		document.getElementById("output").innerHTML += this.innerHTML;
	}

	check=true;
/*if last operation is a equal, the num you hit will be saved as left argument rather than right argument*/
	if(prevOperation == "="){check = false;} 
  	

}

numbers = document.getElementsByName("number");

for (var i=0; i<numbers.length;i++){
	numbers[i].addEventListener("click",numClickHandler, false);
}


/*----memory----*/
function memClearHandler() {
	memoryValue = 0;
	document.getElementById("memSymbol").innerHTML = "";
}

function memStoreHandler() {
    	memoryValue = document.getElementById("output").innerHTML;
    	document.getElementById("memSymbol").innerHTML = "M";
}

function memRecallHandler() {
   	document.getElementById("output").innerHTML = memoryValue;
}

function memAddHandler() {
	currentOutput = document.getElementById("output").innerHTML
	currentOutput = parseFloat(currentOutput);
	memoryValue = parseFloat(memoryValue);
    	memoryValue += currentOutput;
	document.getElementById("memSymbol").innerHTML = "M";
   	clear = true;
}

function memSubtractHandler() {
	currentOutput = document.getElementById("output").innerHTML
	currentOutput = parseFloat(currentOutput);
	memoryValue = parseFloat(memoryValue);
    	memoryValue -= currentOutput;
    	document.getElementById("memSymbol").innerHTML = "M";
    	clear = true;
}

document.getElementById("memClear").addEventListener("click", memClearHandler, false);
document.getElementById("memStore").addEventListener("click", memStoreHandler, false);
document.getElementById("memRecall").addEventListener("click", memRecallHandler, false);
document.getElementById("memAdd").addEventListener("click", memAddHandler, false);
document.getElementById("memSub").addEventListener("click", memSubtractHandler, false);


/*----clear----*/
function clearHandler () {
	document.getElementById("output").innerHTML = 0;
	leftArgument = 0;
	clearFirstNoOp = true;
	clear = true;
    	periodUsed = false;
}

clear = document.getElementById("clear");
clear.addEventListener("click", clearHandler, false);

document.write("clear works ");

/*----period----*/
function periodHandler() { // if it is 0 or if period previously not used it concatenates
    if (false) { // operation was last button hit    
            
    } else if (clear) {
        document.getElementById("output").innerHTML = "0.";
        periodUsed = true;
        clear = false;
    }
    else if (document.getElementById("output") == "0" || !periodUsed) {
        currentOutput = document.getElementById("output").innerHTML;
        document.getElementById("output").innerHTML = currentOutput + ".";
        periodUsed = true;
        clear = false;
    }
}

period = document.getElementById("period");
period.addEventListener("click", periodHandler, false);


/*---operation---*/
function operationHandler() {
	if(check){
		if (this.innerHTML == "+"){
			document.getElementById("output").innerHTML = leftArgument + parseFloat(document.getElementById("output").innerHTML);
			prevOperation="+";
		}
		else if (this.innerHTML=="-"){
			prevOperation="-";
			if(clearFirstNoOp){
				leftArgument=parseFloat(document.getElementById("output").innerHTML);
			}
		        else {
				document.getElementById("output").innerHTML = leftArgument
					- parseFloat(document.getElementById("output").innerHTML);
			}
		}
		else if (this.innerHTML == "*"){
			if(clearFirstNoOp){
				leftArgument=parseFloat(document.getElementById("output").innerHTML);
		    	}
		    	else {
				document.getElementById("output").innerHTML = leftArgument
					* parseFloat(document.getElementById("output").innerHTML);
			}
			prevOperation="*";
		}
		else if (this.innerHTML == "/"){
			document.getElementById("output").innerHTML = leftArgument / parseFloat(document.getElementById		("output").innerHTML);
			prevOperation="/";
		}
	} 

 /*check is equals false.*/ 
	if (this.innerHTML == "+"){		
		prevOperation="+";
	}
	else if (this.innerHTML=="-"){
		prevOperation="-";			
	}
	else if (this.innerHTML == "*"){
		prevOperation="*";
	}
	else if (this.innerHTML == "/"){	
		prevOperation="/";
	}

	leftArgument = parseFloat(document.getElementById("output").innerHTML);
	clear = true;
	clearFirstNoOp=false;
	check=false;

}

operation = document.getElementsByName("operation");
for (var i=0; i<operation.length;i++){
	operation[i].addEventListener("click",operationHandler, false);
}

/*---equalsFunction---*/
function equalsHandler() {
	// 3 + 5 then = hit, show 8, = hit again show 13 ... 18 ... 23
	if (!equal) { // previous operation was hit first time hitting =
        rightArgument = parseFloat(document.getElementById("output").innerHTML);
        switch (prevOperation) {
            	case "+":
		        document.getElementById("output").innerHTML = leftArgument + rightArgument;
                	check = false;
                	break;    
		case "-":
		        document.getElementById("output").innerHTML = leftArgument - rightArgument;
               		check = false;                
                	break;
		case "*":
			document.getElementById("output").innerHTML = leftArgument * rightArgument;
                      	check = false;	            
                	break;
            	case "/":                
                	document.getElementById("output").innerHTML = leftArgument / rightArgument;
                	check = false;                
                	break;
            	case "=":
                	document.getElementById("output").innerHTML = leftArgument;
               		 break;
            	default:
                	break;
        }
        equal = false;
    	} 
	else {	//not the first time hot equal button
        leftArgument = parseFloat(document.getElementById("output").innerHTML);
        document.getElementById("output").innerHTML = leftArgument + rightArgument;
    	}
/* set it to true so next time we hit a num button, it will replace instead of concat*/
	clear = true; 
	prevOperation="=";
	
}

eq = document.getElementById("equals");
eq.addEventListener("click",equalsHandler);


