#!/usr/bin/perl

printf("Sales Figures\n\n");
$minnesotans = 0;
$max_salary = 0;
$richest = "<nobody>";
$n = 0;

while (<>)
{
	@record = split(/:/, $_);
	@name = split(/ /, @record[0]);

	if(@record[3] eq "MN") {
		$minnesotans++;
	}

	if (@record[6] > $max_salary) {
		$max_salary = @record[6];
		$richest = @record[0];
	}

	printf("%s %s has a salary of \$%d\n", @name[1], @name[0], @record[6]);
	$n++;
}

print("-" x 12);
printf("\nNumber of records: %d\n", $n);
printf("%d of them are Minnesotans\n", $minnesotans);
printf("The richest one is %s whose salary is \$%d\n", $richest, $max_salary);