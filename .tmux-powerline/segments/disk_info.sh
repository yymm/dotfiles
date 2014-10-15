# Print disk information

run_segment() {
	diskinfo=$(df -h | head -n 3 | tail -n 1)
	echo ${diskinfo} | awk -F' ' '{printf("%d/%d(GB):%d%",$2,$1,$4)}'
	return 0
}
