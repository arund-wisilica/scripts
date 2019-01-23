### To resize partition to full size of the volume

#!/bin/bash
growpart $(df -k / | grep dev |awk '{print $1}' |rev | cut -c 2- | rev) 1
resize2fs $(df -k / | grep dev |awk '{print $1}')
