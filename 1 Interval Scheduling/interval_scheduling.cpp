#include <stdio.h>
#include <utility>
#include <vector>
#include <algorithm>
using namespace std;

bool compareFinishTime(pair<int, int> a, pair<int, int> b) {
    return a.second < b.second;
}

int main() {
    // Get Input
    int n;
    scanf("%d", &n);
    vector <pair<int, int> > requests(n);
    for (int i=0; i<n; i++) {
        scanf("%d %d", &requests[i].first , &requests[i].second);
    }    
    
    // Sort requests by finish time
    sort(requests.begin(), requests.end(), compareFinishTime);

    // Generate selected requests
    vector <pair<int, int> > answer;

    // Add current smallest finish time
    answer.push_back(requests[0]);
    requests.erase(requests.begin());

    // Check for overlap requests
    vector<pair<int, int> >::iterator ptr;
    for (ptr=requests.begin(); ptr<requests.end(); ptr++) {
        pair<int, int> check = *ptr;
        // printf("%d %d\n", answer.back().first, answer.back().second);
        // printf("\t%d %d\n", check.first, check.second);
        if (check.first < answer.back().second) {
            continue;
        }
        else {
            
            answer.push_back(check);
        }
    }

    // Print selected requests
    // for (int i=0; i<answer.size(); i++) {
    //     printf("%d %d\n", answer[i].first , answer[i].second);
    // }  

    // Total number of selected requests
    printf("%d\n", (int)answer.size());

    return 0; 
}