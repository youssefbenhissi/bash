#! /bin/bash
function execute_command_free(){
echo "1-show output in bytes"
echo "2-show output in kilobytes"
echo "3-show output in megabytes"
echo "4-show output in gigabytes"
echo "5-show output in terabytes"
echo "6-show output in petabytes"
echo "7-show output in kibibytes"
echo "8-show output in mebibytes"
echo "9-show output in gibibytes"
echo "10-show output in tebibytes"
echo "11-show output in pebibytes"
echo "12-show human-readable output"
echo "13-use powers of 1000 not 1024"
echo "14-show detailed low and high memory statistics"
echo "15-show total for RAM + swap"
echo "16-repeat printing every N seconds"
echo "17-repeat printing N times, then exit"
echo "18-wide output"
echo "set your choice:"
read choice
case $choice in 
	"1" )
		free --bytes;;
	"2" )
		free --kilo;;
	"3" )
		free --mega;;
	"4" )
		free --giga;;
	"5" )
		free --tera;;
	"6" )
		free --peta;;
	"7" )
		free --kibi;;
	"8" )
		free --mebi;;
	"9" )
		free --gibi;;
	"10" )
		free --tebi;;
	"11" )
		free --pebi;;
	"12" )
		free --human;;
	"13" )
		free --si;;
	"14" )
		free --lohi;;
	"15" )
		free --total;;
	"16" )
		echo "set the number of seconds"
		read s
		free -s $s;;
	"17" )
		echo "set the number of times"
		read N
		free -c $N;;
	"18" )
		free -w;;
 esac
}
function execute_command_dmidecode()
{
echo "1-Read memory from device FILE (default: /dev/mem)"
echo "2-Display this help text and exit"
echo "3-Less verbose output"
echo "4-Only display the value of the given DMI string"
echo "5-Only display the entries of given type"
echo "6-Only display the entry of given handle"
echo "7-Do not decode the entries"
echo "8-Dump the DMI data to a binary file"
echo "9-Read the DMI data from a binary file"
echo "set your choice"
read choice
case $choice in 
        "1" )
                echo "set your devide file"
		read file
		dmidecode -d $file ;;
	"2" )
		dmidecode --help;;
	"3" )
		dmidecode -q;;
	"4" )
		echo "enter your keyword"
		read keyword
		dmidecode -s $keyword;;
	"5" )
		echo "ente the type of entries"
		read type
		dmidecode -t $type;;
	"6" )
		echo "enter your handle"
		read handle
		dmidecode -H $handle;;
	"7" )
		dmidecode --dump;;
	"8" )
		echo "enter the file"
		read file
		dmidecode --dump-bin $file;;
	"9" )
		echo "enter the path of the file"
		read file1
		dmidecode --from-dump $file1;;
	
esac
}
args=("$@")
if [ ${args[0]} == "-lfree" ]
then
	execute_command_free
fi
if [ ${args[0]} == "-ldmi" ]
then
        execute_command_dmidecode
fi


