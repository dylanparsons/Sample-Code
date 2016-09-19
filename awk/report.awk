BEGIN{
	FS=":";

	### Prints the heading, 'Employees of Today?'
	print "\n\t\t\t      ***Employees of Today***\n";
	printf "--------------------------------------------------------------------";
	print "-----------"

	### Print the names of all employees in the form LastName, FirstName, their birthdays and their salaries.	
	printf "%-20s %-15s %-5s  %-5s\n", "LASTNAME", "FIRSTNAME", "BIRTHDAYS","SALARIES";
	printf "--------------------------------------------------------------------";
	print "-----------"
	Total = 0.0;
	NR= 0; #number of employees
	salary=0;
	highestsalary=0;
	youngestage=0;
	youngestmonth=0;
	youngestday=0;
}
{
	split($1, Name, " ");
	printf "%-20s %-15s %-10s  %-15s\n",Name[2],Name[1],$4,$5;
	salary=salary+$5;
	
	if (highestsalary<$5){
		highestsalary=$5;
		name=$1;
		
	}
	split($4,year,"/");
	year1=year[3]
	month=year[1]
	day=year[2]
	if(youngestage<year1){
		name2=$1;
		youngestage=year1;
		youngestmonth=month;
		youngestday=day;
	}
	else if(youngestage==year1){
		youngestage=year1;
		if(youngestmonth<month){
			name2=$1;
			youngestmonth=month;
			youngestday=day;
		}
	}	
}
END{
	FS=":";
	printf "--------------------------------------------------------------------";
	print "-----------"
	printf "\t\t\t       ***Report Summary***\n ";
	printf "--------------------------------------------------------------------";
	print "-----------"

	### Prints the number of employees
	print ("The number of employees is: ", NR);

	### Prints the average salary
	printf ("The average salary is: $%.2f\n", salary/NR);

	### Prints the name and salary of the highest paid employee
	print ("The highest paid employee is: ", name",", "$" highestsalary);

	### Calculates and prints the name and age of the youngest employee 
	print ("The name and age of the youngest employee is: ", name2 ",", 115-youngestage " years old");
	printf "--------------------------------------------------------------------";
	print "-----------"
	printf ("   *** THANK YOU FOR USING THE REPORT GENERATOR...HAVE A NICE DAY! ***\n");
	printf "--------------------------------------------------------------------";
	print "-----------"
	
}
