clear
 
get_model() {
 
        smartctl -i /dev/$1 | grep 'Device Model' | awk '{ print $NF }'
}
 
get_serial() {
   
    smartctl -i /dev/$1 | grep 'Serial Number' | awk '{ print $3 }'
}
 
get_firmware() {
 
    smartctl -i /dev/$1 | grep 'Firmware' | awk '{ print $3 }'
}
 
get_capacity() {
 
    BYTES=$(smartctl -i /dev/$1 | grep 'Capacity' | awk '{ print $3 }' | sed 's/,//g')
        echo $(( $BYTES / 1000000000 )) 'GB'
}
 
get_temp() {
 
    TEMP=$(smartctl -A /dev/$1 | grep 'Temperature' | awk '{ print $10}')
        echo $TEMP ' C'
}
 
get_smart_id5() {
 
        SMARTID5=$(smartctl -a /dev/$1 | grep 'Reallocated_Sector_Ct' | awk '{ print $10 }')
       
        echo $SMARTID5
}
 
get_smart_id197() {
 
        SMARTID197=$(smartctl -a /dev/$1 | grep 'Current_Pending_Sector' | awk '{ print $10 }')
       
        echo $SMARTID197
}
 
get_smart_id199() {
 
        SMARTID199=$(smartctl -a /dev/$1 | grep 'UDMA_CRC_Error_Count' | awk '{ print $10 }')
       
        echo $SMARTID199
}
 
get_smart() {
 
        SMART=$(smartctl -H /dev/$1 | grep 'test result' | awk '{ print $6 }')
       
        echo $SMART
}
 
display() {
 
    DISK="$1"
    MODEL=`get_model $DISK`
    SERIAL=`get_serial $DISK`
        FIRMWARE=`get_firmware $DISK`
    CAPACITY=`get_capacity $DISK`
    TEMP=`get_temp $DISK`
    SMART=`get_smart $DISK`
        SMARTID197=`get_smart_id197 $DISK`
        SMARTID5=`get_smart_id5 $DISK`
        SMARTID199=`get_smart_id199 $DISK`
 
 
    printf "$FORMAT" "| $DISK" "| $MODEL" "| $SERIAL" "| $FIRMWARE" "| $CAPACITY" "| $TEMP" "| $SMARTID197" "|
$SMARTID5" "| $SMARTID199" "| $SMART" "|"
}
 
FORMAT="%-6s %-12s %-18s %-12s %-12s %-6s %-6s %-6s %-6s %-10s %-1s\n"
 
 
echo "|---------------------------------------------------------------------------------------------------------------|"
printf "$FORMAT" "| DISK" "| MODEL" "| SERIAL NUMBER" "| FIRMWARE" "| CAPACITY" "| TEMP" "| CPS" "| RS" "| UDMA" "| SMART" "|"
echo "|---------------------------------------------------------------------------------------------------------------|"
 
for x in `ls -1 /dev/ada? | cut -d "/" -f 3`
do
        display $x
done
 
echo "|---------------------------------------------------------------------------------------------------------------|"