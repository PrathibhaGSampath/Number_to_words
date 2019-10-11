# Number to word finder

* bundle install

* To run the application $ruby 'app/main.rb'

* This will prompt the user to give the phone number

* To run test: TESTING=true rspec

# Note

* It's open for any length, so no max length check is implemented.

# Logic

* For the given number length and the minimum length find the partition combinations. 
Example: Length = 6 & min_length = 2 then we need these partiton combinations
[2, 2, 2], [3, 3], [4, 2], [2, 4], [6]. 
That meanse for decoding the giving number you can first take two digits at a time of 3 sets or 3 digits at a time of sets 2 or one 4 digit and one 2 digit etc. 

* After getting the partition decode the phone number based on each partition. ie: if you are taking [4, 2] partition then take the first 4 digits from the number and then take the last 2 digits from the number.

* Find the Letter mapping for each digit. ie: 2 is mapped to 'a', 'b', 'c'. So for example if you are given the phone number as "254857" and you are dividing [4,2]. 
"2548" => [['a', 'b', 'c'], ['j', 'k', 'l'], ['g', 'h', 'i'], ['t', 'u', 'v']]
"57" => [['j', 'k', 'l'], ['p', 'q', 'r', 's']]

* Next need to make the words by creating combinations of each letter in the mapping we got. 

* Check the words generated with the dictionary to find actual words. 

* If you are not finding any actual words from dictionary for "2548" then no need to check "57"

* if you found couple of actual words for "2548" and "57" then find the combination of these two to get the comblete combination. 

# Output

Please Enter the phone number
2282668687
Generating words from 2282668687, Please wait.
[["act", "boo", "tots"], ["act", "boo", "tour"], ["act", "con", "tots"], ["act", "con", "tour"], ["act", "coo", "tots"], ["act", "coo", "tour"], ["bat", "boo", "tots"], ["bat", "boo", "tour"], ["bat", "con", "tots"], ["bat", "con", "tour"], ["bat", "coo", "tots"], ["bat", "coo", "tour"], ["cat", "boo", "tots"], ["cat", "boo", "tour"], ["cat", "con", "tots"], ["cat", "con", "tour"], ["cat", "coo", "tots"], ["cat", "coo", "tour"], ["act", "boot", "mus"], ["act", "boot", "nus"], ["act", "boot", "our"], ["act", "coot", "mus"], ["act", "coot", "nus"], ["act", "coot", "our"], ["bat", "boot", "mus"], ["bat", "boot", "nus"], ["bat", "boot", "our"], ["bat", "coot", "mus"], ["bat", "coot", "nus"], ["bat", "coot", "our"], ["cat", "boot", "mus"], ["cat", "boot", "nus"], ["cat", "boot", "our"], ["cat", "coot", "mus"], ["cat", "coot", "nus"], ["cat", "coot", "our"], ["acta", "mot", "mus"], ["acta", "mot", "nus"], ["acta", "mot", "our"], ["acta", "not", "mus"], ["acta", "not", "nus"], ["acta", "not", "our"], ["acta", "oot", "mus"], ["acta", "oot", "nus"], ["acta", "oot", "our"], ["acta", "mounts"], ["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["catamounts"]]

Time Elapsed: 1.49216628074646
 
