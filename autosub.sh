echo "welcome err0r"
echo "Enter the domain name:"
read domain
echo "Enter location of output file:"
read location
echo "Running Subfinder on $domain"
subfinder -d $domain -o subfindertest.txt -v
echo "Running Sublist3r on $domain"
sublist3r -d $domain -o sublist3rtest.txt -v
echo "Removing duplicate value"
cat subfindertest.txt sublist3rtest.txt | sort -u > finalsub.txt
cat finalsub.txt | httpx-toolkit > all$domain.txt
rm subfindertest.txt sublist3rtest.txt amasstest.txt finalsub.txt
cp all$domain.txt ./$location/
rm all$domain.txt
