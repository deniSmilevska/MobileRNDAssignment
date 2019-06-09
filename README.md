# MobileRNDAssignment

* The project is XCode 9.3 compatible and is written in Swift5. 12.2 iOS Deployment Target. 
* Downloading of all cities is done at once, by using JSON Decoder. 
* Downloading and sorting the cities is done only once when opening the app. For all additional operations with the cities we are using the same previously downloaded and sorted array. 
* A SplitView controller is used to show two different view controllers next to each other on landscape mode. 
* The search algorithm: 
    -> For the first entered letter, we are searching trough the whole list that has all the cities. 
        * keeping the prevously Searched string
        * keeping the filtered List
    -> Next, if the next searching string is just + another letter from the previous searched string , then we are searching only into the filtered list instead of the list that has all the cities. 
    Ex:  previouslySearchedString = "A"
            searchingString = "Ai"
            This means that we have the results for "Ai" as a subset of the results for "A", so we can look only into the prevously filtered list. 
    -> Then if we go back again (delete a letter from the search string) we are looking again into the list that has all cities, but updating the filteredList, just in case if the user adds another letter to the search string again. 
    -> We are refreshing the table view on each change in the Search bar. 
    
* No third party libraries are used

