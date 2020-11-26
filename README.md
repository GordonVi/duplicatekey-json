# duplicatekey-json  
Check JSON for duplicate keys in Powershell

# Example  
duplicatekey-json($string)

- -1 = not a valid JSON 

-  0 = no duplicates  **<-- This is what you want to see**

- \>0 = number of duplicates  

# Inspiration  
Response to [this Reddit post.](https://old.reddit.com/r/PowerShell/comments/k0r4r4/detecting_duplicate_object_property_inside_the/)
