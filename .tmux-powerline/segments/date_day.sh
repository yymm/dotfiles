# Prints the name of the current day.

run_segment() {
	env LANG=en date +"%a"
	return 0
}
