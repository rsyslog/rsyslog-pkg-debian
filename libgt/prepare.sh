!#/bin/sh
TARGZFILES=` ls -d */`
PLATFORM="squeeze wheezy"

echo "-------------------------------------"
echo "--- Prepare Release               ---"
echo "-------------------------------------"

select szPrepareDir in $TARGZFILES
do
        echo "Select Ubuntu DIST:"
        select szPlatform in $PLATFORM
        do
                echo "Preparing '$szPrepareDir'"
                break;
        done
        break;
done

#szSourceBase=`basename $szSourceFile .tar.gz`
#szSourceBase=`echo $szSourceBase | sed 's/_/-/'`

#echo "$szSourceBase";
#exit; 

#tar xfz $szSourceFile 
#mv $szSourceFile $szReplaceFile.orig.tar.gz

cp -r $szPlatform/debian $szPrepareDir
cd $szPrepareDir
dch -i
debuild -S -rfakeroot -kAEF0CF8E

