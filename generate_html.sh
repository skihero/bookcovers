#!/bin/bash
filename="$1"
photogrid="$2"
book_images="$3"
##  usage :  bash generate_html.sh  book_images.txt  photogrid book_images.html 
###  for link in `ls book_*.html`; do grep imgBlkFront $link |awk -F 'src=\"' '{print $2}' |awk -F '\" onload' '{print $1}'; done |tr -s "\n" >>book_images.txt

declare -i i=0
cat $photogrid >$book_images
echo "photogrid template to book_images \n"

while IFS=  read -r url 
do 
	if !(( $i % 5 )) ; then 
	echo "</div> <div class=\"column\"> " >> $book_images
 fi 
 i=$i+1 ; 

 echo "<img src=\""$url"\" style=\"width:100%\">" >> $book_images
done < "$filename"

echo "adding terminating tags" 
echo "	</div> </body> </html> " >> $book_images

