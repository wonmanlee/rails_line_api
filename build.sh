echo Building line server sample text files...

seq -s " Salsify line server\n" -w 100     > 100.txt
echo 100.txt has been created.
seq -s " Salsify line server\n" -w 10000   > 10000.txt
echo 10000.txt has been created.
seq -s " Salsify line server\n" -w 100000  > 100000.txt
echo 100000.txt has been created.