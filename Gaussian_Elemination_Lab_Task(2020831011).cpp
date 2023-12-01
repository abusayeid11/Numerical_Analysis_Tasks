
#include <bits/stdc++.h>
using namespace std;
int main()
{
    float a[10][10], x[5], r;

    int n;

    n = 3;

    // taking inputs for t = 5, 8, 11

    for(int i=0;i<n;i++){
        for(int j=0;j<=n;j++){
            float p;
            if(i == 0){
                p = 5;
                a[i][3] = 106.8;
            }
             if(i == 1){
                p = 8;
                a[i][3] = 177.2;
            }
             if(i == 2){
                p = 11;
                a[i][3] = 279.2;
            }

            if(j == 0) a[i][j] = p*p;
            if(j == 1) a[i][j] = p;
            if(j == 2) a[i][j] = 1;
        }
    }

    // generating upper triangular matrix
    for(int i=0;i<n-1;i++){
        if(a[i][i] == 0.0){
            cout << "Error\n";
            return 0;
        }

        for(int j = i+1;j<n;j++){
            r = a[j][i]/a[i][i];
            for(int k = 0; k<=n;k++){
                a[j][k] = a[j][k] - r*a[i][k];
            }
        }
    }

    // back substitution
    x[n-1] = a[n-1][n]/a[n-1][n-1];

    for(int i=n-2; i>=0; i--){
        x[i] = a[i][n];

        for(int j= i+1; j<n;j++){
            x[i] = x[i] - a[i][j]*x[j];
        }

        x[i] = x[i]/a[i][i];
    }

    // printing a1, a2, a3
    for(int i=0;i<n;i++){
        cout << "a" << i+1 << ": " << x[i] << endl;
    }

    // velocity for t = 6
    float t = 6.0;
    float vel = 0;
    for(int i=0;i<3;i++){
            float sum = 1;
        for(int j = 0;j<2-i;j++){
            sum*=t;
        }
        vel += sum*x[i];
    }

    cout << vel << endl;
}
