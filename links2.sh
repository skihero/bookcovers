for link in `ls book_*.html`; do grep imgBlkFront $link |awk -F 'src=\"' '{print $2}' |awk -F '\" onload' '{print $1}'; done |tr -s "\n" >>book_images.txt
