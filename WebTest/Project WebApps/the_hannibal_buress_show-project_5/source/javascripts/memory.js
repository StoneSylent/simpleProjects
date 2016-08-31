/*----memory----*/
function memClearHandler() {
	memoryValue = 0;
	document.getElementById("MemSymbol").innerHTML = "";
}

function memStoreHandler() {
    memoryValue = document.getElementById("output").innerHTML;
    document.getElementById("MemSymbol").innerHTML = "M";
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
}

function memSubtractHandler() {
	currentOutput = document.getElementById("output").innerHTML
	currentOutput = parseFloat(currentOutput);
	memoryValue = parseFloat(memoryValue);
    memoryValue -= currentOutput;
    docuemnt.getElementById("MemSymbol").inner.HTML = "M";
}


document.getElementByID("memClear").addEventListener("click", memClearHandler(), false);
document.getElementById("memStore").addEventListener("click", memStoreHandler(), false);
document.getElementById("memRecall").addEventListener("click", memRecallHandler(), false);
document.getElementById("memAdd").addEventListener("click", memAddHandler(), false);
document.getElementById("MemSub").addEventListener("click", memSubtractHandler(), false);

