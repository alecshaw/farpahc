CS="java -classpath CS_2.002.75.jar csearch/CorpusSearch"

cp $1 temp.psd
FILE="temp.psd"
rm problemfile.txt

echo ""
echo "Delete ID"
$CS structure_queries/parsald-delete-id.q $FILE > problemfile.txt
mv -f $FILE.out $FILE

echo ""
echo "Delete CODE"
$CS structure_queries/parsald-delete-code.q $FILE > problemfile.txt
mv -f $FILE.out $FILE

echo ""
echo "Delete ICH"
$CS structure_queries/parsald-delete-ICH.q $FILE > problemfile.txt
mv -f $FILE.out $FILE

echo ""
echo "Delete traces"
$CS structure_queries/parsald-delete-traces.q $FILE > problemfile.txt
mv -f $FILE.out $FILE

echo ""
echo "Delete 0"
$CS structure_queries/parsald-delete-0.q $FILE > problemfile.txt
mv -f $FILE.out $FILE

echo ""
echo "Delete empty subjects"
$CS structure_queries/parsald-delete-empty_subjects.q $FILE > problemfile.txt
mv -f $FILE.out $FILE

python3 "scripts/rm-lemmata.py" $FILE > $FILE.out
mv -f $FILE.out $FILE

python scripts/removeindex.py $FILE > $FILE.out
mv -f $FILE.out $FILE

mv -f $FILE $2

grep -a12 "WARNING" problemfile.txt
