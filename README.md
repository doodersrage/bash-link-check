bash-link-check
===============
BASH script that uses curl to gather HTTP header response values from a text document list of links. Used for testing redirects on website rebuilds to ensure they have been written for all old page locations.

To run:
1. Collect all of the links within your website then store them one per line within the pages.txt file.
2. Modify REPLACE variable to be the OLD URL for the links within your pages.txt file. 
3. Modify NEWURL variable to be the domain at which you would like to test the links pulled from your old website.
4. Open or go to console, browse to where you have stored this script then type bash parse.sh or /bin/bash parse.sh to run the script. 

Give it some time to run if you have a large list, you can check on it's progress by opening results.txt from time to time. Once the script has finished you will be presented with a count of all the response code types and a DONE! message. Results are stored within the results document. WIthin this document you will find a list of all the links that were checked, the response code it received, and if redirected the new location of that link.
