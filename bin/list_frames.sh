
#!/bin/bash
ratpoison -c sfdump | sed -e 's/:x/\n/g' | sed -e 's/0,/\n/g' | grep frame | awk '{ print $3 }'
