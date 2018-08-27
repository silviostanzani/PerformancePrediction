//#include <iostream>
//#include <iomanip>
#include <stdlib.h>
//#include <cmath>
//#include <sys/time.h>
//#include <time.h>

#include <stdio.h>
#include <math.h>
//#define RAND_MAX 100

//float european_call_opt( const float S, const float X, const float r, const float q, const float sigma, const float time)

double random(double min, double max);

double random(double min, double max)
{

  double r = (double)rand()/RAND_MAX;
  r = r*(max-min)+min;
  return r;
}

/*
//__forceinline
//float cnd_opt(float d){
// return 0.5f +0.5f*erff(float(M_SQRT1_2)*d);
//}

//__forceinline
float european_call_opt( const float S, 
		const float X,
		const float r,
		const float q,
		const float sigma,
		const float time)
{
    //float sigma_sqr =X;// sigma*sigma;
    //float time_sqrt =r+r; // sqrtf(time);
    //float d1 = (logf(S/X) + (r-q + 0.5f*sigma_sqr)*time) - (sigma*time_sqrt);
    //float d1 = (logf(S/X) + (r-q + 0.5f*sigma_sqr)*time)/(sigma*time_sqrt);
    //float d2 = d1-(sigma*time_sqrt);
    
    //float call_price = S * expf(-q*time)* cnd_opt(d1) - X * expf(-r*time) * cnd_opt(d2);
    //float call_price = S * expf(-q*time)* d1 - X * expf(-r*time) * d2;
    //return call_price;
    //return X+r+q;
    return logf(S/X);
};

float ct(const float a, const float b) {
    return logf(a/b);
}*/

int main() {
  int m, nn, i, j;

  double *a;
  double *b;  
  double *c;
  double *d;
  double *e;  
  double *f;
  double randV;  

  //nn=90000000;
  nn=900;

  randV = random(1, 1000);

  a = (double*) malloc(nn*sizeof(double));
  b = (double*) malloc(nn*sizeof(double));
  c = (double*) malloc(nn*sizeof(double));

  d = (double*) malloc(nn*sizeof(double));
  e = (double*) malloc(nn*sizeof(double));
  f = (double*) malloc(nn*sizeof(double));

  for (i=0; i < nn; i++) {
    a[i] = randV+i;
    b[i] = randV-i;  
    c[i] = randV*i;  
    d[i] = randV;
    e[i] = randV;  
    f[i] = randV;  

  }

  //m = 1000000;
  //m =   3000;
  m =   3000000;

  #pragma omp parallel for
  for (j=0; j < m; j++) {
    for (i=0; i < nn; i++) {
      a[i]=sqrtf(b[i])+erff(c[i]);
      //b[i]=sqrtf(a[i])+expf(c[i]);
      //c[i]=sqrtf(a[i])+logf(b[i]); 
      //c[i]=b[i]/sqrtf(a[i]); 
      //c[i]=0.5f +0.5f*erff(float(M_SQRT1_2)*b[i]);
      c[i]=logf(a[i]/b[i]);
      //c[i]=ct( a[i], b[i]);
      //sc[i]=european_call_opt( a[i], b[i], c[i], a[i], b[i], c[i]);      //d[i]=cos(a[i])+sin(b[i]); 

      //e[i]=cos(c[i])+sin(b[i]); 
      //f[i]=cos(d[i])+sin(a[i]); 
    }
  }

  free(a);
  free(b);
  free(c);
  free(d);
  free(e);
  free(f);

  return(0);
}
