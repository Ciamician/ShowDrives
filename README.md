# showDrives

Display Linux / UNIX hard drive info

### What is it?
This shell script will loop through all hard drives in a system and display the following information:
* Device model 
* Serial number
* Firmware
* Capacity
* Temperature
* S.M.A.R.T. info
    * Reallocated sector count
    * Current pending sector count
    * UDMA CRC error count
    * test result (pass / fail)



### Prerequisite(s)
Makes use of the **smartctl** utility



### Usage

1. Download the shell script to your system.

1. Make it executable
```
chmod +x showDrives.sh
```
3. Run the script, using one of the options below:
```
./showDrives.sh
```
OR
```
sh showDrives.sh
```
OR
```
bash showDrives.sh
```



### Sample output
```
|---------------------------------------------------------------------------------------------------------------|
| ada0 | WD60EFRX-68L0BN1 | WD-WX11D38NJP38  | 82.00A82   | 6001 GB    | 34  C | 0    |0    | 0    | PASSED   |
| ada1 | WD60EFRX-68L0BN1 | WD-WX11D189VXT4  | 82.00A82   | 6001 GB    | 34  C | 0    |0    | 0    | PASSED   |
| ada2 | WD60EFRX-68L0BN1 | WD-WX11D28K3RX8  | 82.00A82   | 6001 GB    | 34  C | 0    |0    | 0    | PASSED   |
| ada3 | WD60EFRX-68L0BN1 | WD-WX21D1825SPA  | 82.00A82   | 6001 GB    | 34  C | 0    |0    | 0    | PASSED   |
|---------------------------------------------------------------------------------------------------------------|
```
