function clearForm() {
   document.getElementById('registrationForm').reset()
} //Previous solution of clearning form, currently not in use


function validateForm() {
	let result=0; //Result will remain 0 if form is filled properly, any invalid/missing inputs will increase result
				  //If result doesn't remain at 0, false will be returned so the form won't be submitted

	let fNameVal = document.forms['registrationForm']['firstName'].value;
	let lNameVal = document.forms['registrationForm']['lastName'].value;
	let resAddVal = document.forms['registrationForm']['resAddress'].value;
	let genderVal = document.forms['registrationForm']['gender'].value;
	let phoneVal = document.forms['registrationForm']['phoneNum'].value;

	/*All inputs except phone already have their error HTML, therefore only toggling between visibility
	Putting them in an array for looping to check through each value individually*/
	let validations=[fNameVal,lNameVal,resAddVal,genderVal];  //Value of input
	let validationtoggle=['fNameErr','lNameErr','resAddErr','genderErr']; //Name of input

	for (let i=0; i<validations.length;i++){
		if (validations[i]==''){
			document.getElementById(validationtoggle[i]).className="warnOn"; //If empty, toggle warnOn css and increase result
			result+=1;
		}
	
		else{document.getElementById(validationtoggle[i]).className="warnOff";
		}//If was previously empty and warnOn css was toggled, toggle it back to warnOff
	}



	//Phone Number Validation Starts
	if (phoneVal== '' ){
		document.getElementById('phoneErr').className="warnOn";
		document.getElementById('phoneErr').innerHTML="Cannot be empty!";
		result+=1;	
	}

	else if (phoneVal.search(/\D/g)>=0){
		document.getElementById('phoneErr').className="warnOn";
		document.getElementById('phoneErr').innerHTML="Field must only contain numbers!";
		result+=1;
	}

	else if (phoneVal.length>11){
		document.getElementById('phoneErr').className="warnOn";
		document.getElementById('phoneErr').innerHTML="No more than 11 digits!";
		result+=1;
	}
	
	else{
		document.getElementById('phoneErr').className="warnOff";
	}
	//Phone Number Validation Ends


	if (result!=0){return false}
}