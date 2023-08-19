#include <bits/stdc++.h> 

#include <omp.h>
#include "energia.h"


using namespace std; 

int MaxIncreasingSub(int arr[], int n, int k) 
{ 
	int **dp, ans = -1;
	dp = new int *[n];
	for(int i=0; i < n; i++)
		dp[i] = new int[k+1];
	for(int i = 0; i < n; i++){
		for(int j = 0; j < k; j++){
			dp[i][j] = -1;
		}
	}
	for (int i = 0; i < n; i++) { 
		dp[i][1] = arr[i]; 
	} 
	for (int i = 1; i < n; i++) { 
		for (int j = 0; j < i; j++) { 
			if (arr[j] < arr[i]) { 
				for (int l = 1; l <= k - 1; l++) { 
					if (dp[j][l] != -1) { 
						dp[i][l + 1] = max(dp[i][l + 1],dp[j][l] + arr[i]); 
					} 
				} 
			} 
		} 
	} 

	for (int i = 0; i < n; i++) { 
		if (ans < dp[i][k]) 
			ans = dp[i][k]; 
	} 

	return (ans == -1) ? 0 : ans; 
} 

int main() 
{ 
    rapl_init();


	int n, k;
	cin >> n;
	cin >> k;
	int arr[n];
	for (int i=0; i<n; i++)
		cin >> arr[i];

    // start time and energy counters
    start_rapl_sysfs();
    double start = omp_get_wtime();

    // run application
	int ans = MaxIncreasingSub(arr, n, k); 

    // finish time and energy counters
    double energy = end_rapl_sysfs(); 
    double finish = omp_get_wtime();

	//print energy and total time elapsed
    cout << energy << "\n";
    cout << finish-start << "\n";

    return 0;
} 

